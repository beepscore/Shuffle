//
//  BSShuffler.m
//  Shuffle
//
//  Created by Steve Baker on 6/12/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "BSShuffler.h"
#import "BSShufflerPrivate.h"
#import "BSStringUtils.h"

@implementation BSShuffler

- (BOOL)isNodeValue:(BSNode *)node equalToValue:(NSString *)value {

    if (!value && !node.value) {
        return true;
    }

    if (value && node.value
        && [node.value isEqualToString:value]) {
        // First two conditionals check both values are non nil.
        // They are objects and so are safe to compare via isEqualToString
        return true;
    }
    return false;
}

- (BOOL)isNode:(BSNode *)node
         index:(NSNumber *)index
 atEndOfString:(NSString *)string {
    
    if ([BSStringUtils isStringNilOrEmpty:string]) {
        return YES;
    }
    if ([index integerValue] == string.length - 1) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isNode:(BSNode *)node index0AtEndOfString:(NSString *)string {
    return [self isNode:node index:node.index0 atEndOfString:string];
}

- (BOOL)isNode:(BSNode *)node index1AtEndOfString:(NSString *)string {
    return [self isNode:node index:node.index1 atEndOfString:string];
}

//==========================================================================

- (ShuffleValidityCode)isValidShuffleForEdgeCases:(NSString *)shuffledString
                           string0:(NSString *)string0
                           string1:(NSString *)string1 {

    if (!shuffledString) {
        if (!string0 && !string1) {
            return kShuffleValid;
        } else {
            return kShuffleNotValid;
        }
    }

    if ([@"" isEqualToString:shuffledString]) {
        if ([@"" isEqualToString:string0] && [@"" isEqualToString:string1]) {
            return kShuffleValid;
        } else {
            return kShuffleNotValid;
        }
    }

    if (shuffledString
        && [BSStringUtils isStringNilOrEmpty:string0]
        && [BSStringUtils isStringNilOrEmpty:string1]) {
        return kShuffleNotValid;
    }
    
    if ([BSStringUtils isStringNilOrEmpty:string0]
        && [shuffledString isEqualToString:string1]) {
        return kShuffleValid;
    }
    
    if ([BSStringUtils isStringNilOrEmpty:string1]
        && [shuffledString isEqualToString:string0]) {
        return kShuffleValid;
    }
    return kShuffleValidityUnknown;
}

- (BOOL)isLeafNode:(BSNode *)node
           string0:(NSString *)string0
           string1:(NSString *)string1 {

    if ([BSStringUtils isStringNilOrEmpty:string0]
        && [BSStringUtils isStringNilOrEmpty:string1]) {
        return YES;
    }

    if ([BSStringUtils isStringNilOrEmpty:string0]) {
        if ([node.index1 integerValue] == string1.length - 1) {
            return YES;
        } else {
            return NO;
        }
    }

    if ([BSStringUtils isStringNilOrEmpty:string1]) {
        if ([node.index0 integerValue] == string0.length - 1) {
            return YES;
        } else {
            return NO;
        }
    }

    // string0 and string1 are non-empty
    
    if ([self isNode:node index0AtEndOfString:string0]
        && [self isNode:node index0AtEndOfString:string1]) {
            return YES;
        } else {
            return NO;
        }
}

- (BOOL)isASolution:(BSNode *)node
     shuffledString:(NSString *)shuffledString
           ofString:(NSString *)string0
         withString:(NSString *)string1 {

    if ([self isLeafNode:node string0:string0 string1:string1]
        && [self isNodeValue:node equalToValue:shuffledString]) {
        return YES;
    } else {
        return NO;
    }
}

//==========================================================================
- (BOOL)isValidShuffle:(NSString *)shuffledString
              ofString:(NSString *)string0
            withString:(NSString *)string1 {

    return NO;
}

@end
