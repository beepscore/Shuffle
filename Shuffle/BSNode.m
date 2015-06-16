//
//  BSNode.m
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "BSNode.h"

@implementation BSNode

#pragma mark - Initializers
// designated initializer
- (instancetype)initWithValue:(NSString *)value
                       index0:(NSNumber *)index0
                       index1:(NSNumber *)index1
                         left:(BSNode *)left
                        right:(BSNode *)right {
    
    // call super's designated intializer
    self = [super init];
    if (self) {
        self.value = value;
        self.index0 = index0;
        self.index1 = index1;
        self.left = left;
        self.right = right;
    }
    return self;
}

// override superclass' designated initializer.
- (instancetype)init {
    // call designated initializer
    return [self initWithValue:nil
                        index0:nil
                        index1:nil
                          left:nil
                         right:nil];
}

@end
