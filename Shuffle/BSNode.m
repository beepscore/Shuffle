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
                       index0:(NSInteger)index0
                       index1:(NSInteger)index1
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
                        index0:0
                        index1:0
                          left:nil
                         right:nil];
}

- (NSString *)description {

    NSString *descriptionString = @"";
    const NSString *SEPARATOR_SPACE = @", ";
    NSString *valueString = @"";
    NSString *index0String = @"";
    NSString *index1String = @"";
    NSString *leftString = @"";
    NSString *rightString = @"";

    if (!self.value) {
        valueString = @"nil";
    } else {
        valueString = self.value;
    }

    index0String = [NSString stringWithFormat:@"%ld", (long)self.index0];
    index1String = [NSString stringWithFormat:@"%ld", (long)self.index1];

    if (!self.left) {
        leftString = @"left: nil";
    } else {
        leftString = [NSString stringWithFormat:@"left.value: %@", self.left.value];
    }
    if (!self.right) {
        rightString = @"right: nil";
    } else {
        rightString = [NSString stringWithFormat:@"right.value: %@", self.right.value];
    }

    descriptionString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@",
                         valueString, SEPARATOR_SPACE,
                         index0String, SEPARATOR_SPACE,
                         index1String, SEPARATOR_SPACE,
                         leftString, SEPARATOR_SPACE,
                         rightString];

    return descriptionString;
}

@end
