//
//  BSShuffler.h
//  Shuffle
//
//  Created by Steve Baker on 6/12/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSNode.h"

@interface BSShuffler : NSObject

/** @return YES if shuffledString is a valid "shuffle" of string0 and string1.
 *  else return NO.
 *  shuffledString is valid if it can be formed by interleaving
 *  the characters of string0 and string1 in a way that maintains
 *  the left to right ordering of the characters from each string.
 *
 *  Example:
 *  YES == [BSShuffler isValidShuffle:@"dabecf"
 *                           ofString:@"abc"
 *                         withString:@"def"];
 */
-(BOOL) isValidShuffle:(NSString *)shuffledString
              ofString:(NSString *)string0
            withString:(NSString *)string1;

@end
