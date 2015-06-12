//
//  BSShuffler.m
//  Shuffle
//
//  Created by Steve Baker on 6/12/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "BSShuffler.h"

@implementation BSShuffler

+(BOOL) isValidShuffle:(NSString *)shuffledString
              ofString:(NSString *)string0
            withString:(NSString *)string1 {
    
    NSString *candidateShuffledString = @"";
    
    /** An array of binary values indicating source as string0 or string1.  
     *  Maximum array length = m + n  
     */
    NSArray *sourceStringForIndex = @[];

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
