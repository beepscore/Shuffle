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

@end
