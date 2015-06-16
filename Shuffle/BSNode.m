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
    if (!self.index0) {
        index0String = @"nil";
    } else {
        index0String = [self.index0 description];
    }
    if (!self.index1) {
        index1String = @"nil";
    } else {
        index1String = [self.index1 description];
    }
    if (!self.left) {
        leftString = @"nil";
    } else {
        leftString = self.left.value;
    }
    if (!self.right) {
        rightString = @"nil";
    } else {
        rightString = self.right.value;
    }

    descriptionString = [NSString stringWithFormat:@"%@%@%@%@%@%@left: %@%@right: %@",
                         valueString, SEPARATOR_SPACE,
                         index0String, SEPARATOR_SPACE,
                         index1String, SEPARATOR_SPACE,
                         leftString, SEPARATOR_SPACE,
                         rightString];

    return descriptionString;
}

@end
