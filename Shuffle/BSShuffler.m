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

- (BOOL)isValidShuffle:(NSString *)shuffledString
              ofString:(NSString *)string0
            withString:(NSString *)string1 {
    
    NSString *candidateShuffledString = @"";
    
    /** An array of binary values indicating source as string0 or string1.  
     *  Maximum array length = m + n  
     */
    //NSArray *sourceStringForIndex = @[];

    // TODO: Fix infinite loop. Change pseudocode to code and test.

    BOOL stop = NO;
    //Iterate while possible valid paths remain and haven't found a solution
    while (stop == NO) {
        
        if ([candidateShuffledString isEqualToString:shuffledString]) {
            //found a solution
            return YES;
        }
        
        /*
         if (pop from string0 would build valid candidateShuffledString
         && sourceStringForIndex.length == index - 1 ) {
             // we haven't already tried pop from string0 at this index
             pop from string0
             append sourceStringForIndex[index] = 0  
         }
         
         else if (pop from string1 would build valid candidateShuffledString  
         && sourceStringForIndex.length == index  
         && sourceStringForIndex[index - 1] != 1 ) {
             // we haven't already tried pop from string1 at this index)
             pop from string1
             set sourceStringForIndex[index - 1] = 1  
         }
         
         else {
             mark this path as visited or bad? (not sure if we need to do this)
             Backtrack one letter
             push letter back onto its source string stack.
             remove sourceStringForIndex[lastIndex]  
             decrement index
         }
         
         // continue while loop
         */
    }
    return NO;
}

@end
