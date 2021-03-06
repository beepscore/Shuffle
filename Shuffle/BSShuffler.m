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
#import "BSNode.h"

@implementation BSShuffler

+ (BOOL)isNodeValue:(BSNode *)node equalToValue:(NSString *)value {

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

//==========================================================================
#pragma mark - node index methods

+ (BOOL)isNode:(BSNode *)node
         index:(NSInteger)index
 atEndOfString:(NSString *)string {
    
    if ([BSStringUtils isStringNilOrEmpty:string]) {
        return YES;
    }
    if (index == (NSInteger)string.length - 1) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isNode:(BSNode *)node index0AtEndOfString:(NSString *)string {
    return [self isNode:node index:node.index0 atEndOfString:string];
}

+ (BOOL)isNode:(BSNode *)node index1AtEndOfString:(NSString *)string {
    return [self isNode:node index:node.index1 atEndOfString:string];
}

//==========================================================================
#pragma mark -

+ (BSShuffleValidityCode)isValidShuffleForEdgeCases:(NSString *)shuffledString
                                            string0:(NSString *)string0
                                            string1:(NSString *)string1 {

    if (!shuffledString) {
        if (!string0 && !string1) {
            return BSShuffleValidityCodeValid;
        } else {
            return BSShuffleValidityCodeNotValid;
        }
    }

    if ([@"" isEqualToString:shuffledString]) {
        if ([@"" isEqualToString:string0] && [@"" isEqualToString:string1]) {
            return BSShuffleValidityCodeValid;
        } else {
            return BSShuffleValidityCodeNotValid;
        }
    }

    if (shuffledString
        && [BSStringUtils isStringNilOrEmpty:string0]
        && [BSStringUtils isStringNilOrEmpty:string1]) {
        return BSShuffleValidityCodeNotValid;
    }
    
    if ([BSStringUtils isStringNilOrEmpty:string0]
        && [shuffledString isEqualToString:string1]) {
        return BSShuffleValidityCodeValid;
    }
    
    if ([BSStringUtils isStringNilOrEmpty:string1]
        && [shuffledString isEqualToString:string0]) {
        return BSShuffleValidityCodeValid;
    }
    return BSShuffleValidityCodeUnknown;
}

+ (BOOL)isLeafNode:(BSNode *)node
           string0:(NSString *)string0
           string1:(NSString *)string1 {

    if ([BSStringUtils isStringNilOrEmpty:string0]
        && [BSStringUtils isStringNilOrEmpty:string1]) {
        return YES;
    }

    if ([BSStringUtils isStringNilOrEmpty:string0]) {
        if (node.index1 == (NSInteger)string1.length - 1) {
            return YES;
        } else {
            return NO;
        }
    }

    if ([BSStringUtils isStringNilOrEmpty:string1]) {
        if (node.index0 == (NSInteger)string0.length - 1) {
            return YES;
        } else {
            return NO;
        }
    }

    // string0 and string1 are non-empty
    
    if ([BSShuffler isNode:node index0AtEndOfString:string0]
        && [BSShuffler isNode:node index1AtEndOfString:string1]) {
            return YES;
        } else {
            return NO;
        }
}

+ (BOOL)isASolution:(BSNode *)node
     shuffledString:(NSString *)shuffledString
           ofString:(NSString *)string0
         withString:(NSString *)string1 {

    if ([BSShuffler isLeafNode:node string0:string0 string1:string1]
        && [BSShuffler isNodeValue:node equalToValue:shuffledString]) {
        return YES;
    } else {
        return NO;
    }
}

//==========================================================================
#pragma mark -

- (BOOL)isValidShuffle:(NSString *)shuffledString
              ofString:(NSString *)string0
            withString:(NSString *)string1 {
    
    BSShuffleValidityCode shuffleValidityCode = [BSShuffler isValidShuffleForEdgeCases:shuffledString
                                                                         string0:string0
                                                                         string1:string1];
    switch (shuffleValidityCode) {
        case BSShuffleValidityCodeNotValid: {
            return NO;
        }
        case BSShuffleValidityCodeValid: {
            return YES;
        }
        case BSShuffleValidityCodeUnknown: {
            // edge cases could not determine if shuffle is valid, don't return yet
            break;
        }
        default:
            break;
    }

    // TODO: Consider create queue class that wraps NSMutableArray
    // to implement strict fifo queue
    NSMutableArray *queue = [NSMutableArray arrayWithArray:@[]];
    
    [self addRootNodeToQueue:queue];
    
    while (queue.count > 0) {
        
        // queue - remove from beginning of array
        BSNode *node = [queue firstObject];
        [queue removeObjectAtIndex:0];
        
        [self.nodesSearched addObject:node.value];
        
        if ([BSShuffler isLeafNode:node string0:string0 string1:string1]) {
            // node is a terminal node
            if ([BSShuffler isASolution:node
                   shuffledString:shuffledString
                         ofString:string0
                       withString:string1]) {
                return YES;
            } else {
                // skip to next iteration, next node in queue
                continue;
            }
        }

        NSString *shuffledStringStart = [BSShuffler shuffledStringStart:shuffledString
                                                             node:node];

        if ([BSShuffler isNodeValue:node equalToValue:shuffledStringStart]){
            // path to this node is a valid candidate, so add sub-branches
            [BSShuffler addLeftNodeToNode:node andQueue:queue string0:string0];
            [BSShuffler addRightNodeToNode:node andQueue:queue string1:string1];
        }
    }
    
    // didn't find a solution
    return NO;
}

//==========================================================================
#pragma mark -

- (void)addRootNodeToQueue:(NSMutableArray *)queue {
    // this index value signifies node has no letters from that source
    // e.g. if node.index0 == -1, node.value contains no letters from string0
    const NSInteger INDEX_BEFORE_SOURCE_START = -1;
    
    self.nodesSearched = [NSMutableArray arrayWithArray:@[]];
    
    // root node has empty value and no letters from either source string
    BSNode *root = [[BSNode alloc] initWithValue:@""
                                          index0:INDEX_BEFORE_SOURCE_START
                                          index1:INDEX_BEFORE_SOURCE_START
                                            left:nil
                                           right:nil];
    // queue, add to end of array
    [queue addObject:root];
}

/** 
 * @return start of shuffled string, length equal to node value length
 */
+ (NSString *)shuffledStringStart:(NSString *)shuffledString
                             node:(BSNode *)node {
    NSString *shuffledStart = nil;
    if ([BSShuffler isNodeValue:node equalToValue:@""]) {
        shuffledStart = @"";
    } else {
        shuffledStart = [BSStringUtils safeSubstringInclusive:shuffledString
                                                         startIndex:0
                                                           endIndex:node.value.length - 1];
    }
    return shuffledStart;
}

+ (void)addLeftNodeToNode:(BSNode *)node
                 andQueue:(NSMutableArray *)queue
                  string0:(NSString *)string0 {
    // index0 may be < 0, string.length returns NSUInteger so cast
    if (string0
        && (node.index0 < (NSInteger)string0.length)) {
        NSString *string0AtIndex = [BSStringUtils
                                    safeSubstringLengthOne:string0
                                    index:node.index0 + 1];
        NSString *nodeLeftValue = [node.value stringByAppendingString:string0AtIndex];
        node.left = [[BSNode alloc] initWithValue:nodeLeftValue
                                           index0:node.index0 + 1
                                           index1:node.index1
                                             left:nil
                                            right:nil];
        [queue addObject:node.left];
    }
}

+ (void)addRightNodeToNode:(BSNode *)node
                  andQueue:(NSMutableArray *)queue
                   string1:(NSString *)string1 {
    if (string1
        && (node.index1 < (NSInteger)string1.length)) {
        NSString *string1AtIndex = [BSStringUtils
                                    safeSubstringLengthOne:string1
                                    index:node.index1 + 1];
        NSString *nodeRightValue = [node.value stringByAppendingString:string1AtIndex];
        node.right = [[BSNode alloc] initWithValue:nodeRightValue
                                            index0:node.index0
                                            index1:node.index1 + 1
                                              left:nil
                                             right:nil];
        [queue addObject:node.right];
    }
}

@end
