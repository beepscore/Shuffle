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
@property (assign, nonatomic) NSInteger index0;
@property (assign, nonatomic) NSInteger index1;
@property (strong, nonatomic) BSNode *left;
@property (strong, nonatomic) BSNode *right;

// designated initializer
- (instancetype)initWithValue:(NSString *)value
                       index0:(NSInteger)index0
                       index1:(NSInteger)index1
                         left:(BSNode *)left
                        right:(BSNode *)right NS_DESIGNATED_INITIALIZER;

@end
