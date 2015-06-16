//
//  BSStringUtils.h
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//
// Could write these methods as a category on NSString instead.
// Use utility class, it is more easily discoverable by programmer.

#import <Foundation/Foundation.h>

@interface BSStringUtils : NSObject

+ (BOOL)isStringNilOrEmpty:(NSString *)string;

@end
