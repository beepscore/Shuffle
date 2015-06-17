//
//  BSStringUtils.m
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "BSStringUtils.h"

@implementation BSStringUtils

+ (BOOL)isStringNilOrEmpty:(NSString *)string {
    
    if (!string || string.length == 0) {
        return YES;
    } else {
        return NO;
    }
}

+(NSString *)safeSubstringInclusive:(NSString *)aString
                         startIndex:(NSInteger)startIndex
                           endIndex:(NSInteger)endIndex {
    NSString *substring = @"";
    if (endIndex >= aString.length - 1) {
        // endIndex is at or past end of aString
        substring = [aString substringFromIndex:startIndex];
    } else {
        substring = [aString substringWithRange:NSMakeRange(startIndex,
                                                            (endIndex - startIndex) + 1)];
    }
    return substring;
}

@end
