//
//  BSNode.h
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSNode : NSObject

@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSNumber *index0;
@property (strong, nonatomic) NSNumber *index1;
@property (strong, nonatomic) BSNode *left;
@property (strong, nonatomic) BSNode *right;

// designated initializer
- (instancetype)initWithValue:(NSString *)value
                       index0:(NSNumber *)index0
                       index1:(NSNumber *)index1
                         left:(BSNode *)left
                        right:(BSNode *)right;

@end
