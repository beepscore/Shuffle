//
//  BSNodeTest.m
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BSNode.h"

@interface BSNodeTests : XCTestCase

@end

@implementation BSNodeTests

- (void)testNodePropertiesNil {

    BSNode *node = [[BSNode alloc] init];
    XCTAssertNotNil(node);

    XCTAssertNil(node.value);
    XCTAssertEqual(0, node.index0);
    XCTAssertEqual(0, node.index1);
    XCTAssertNil(node.left);
    XCTAssertNil(node.right);
}

- (void)testNodeDescriptionPropertiesNil {
    BSNode *node = [[BSNode alloc] init];
    NSString *expected = @"nil, 0, 0, left: nil, right: nil";
    XCTAssertEqualObjects(expected, [node description]);
}

- (void)testNodeProperties {
    BSNode *joe = [[BSNode alloc] init];
    
    NSString *testValue = @"Joe";
    joe.value = testValue;
    XCTAssertEqualObjects(testValue, joe.value);
    
    NSString *expectedDescription = @"Joe, 0, 0, left: nil, right: nil";
    XCTAssertEqualObjects(expectedDescription, [joe description]);
    
    BSNode *larry = [[BSNode alloc] init];
    joe.left = larry;
    larry.value = @"Larry";
    XCTAssertEqualObjects(larry, joe.left);
    
    expectedDescription = @"Joe, 0, 0, left.value: Larry, right: nil";
    NSString *actual = [NSString stringWithFormat:@"%@", joe];
    XCTAssertEqualObjects(expectedDescription, actual);
    
    BSNode *rick = [[BSNode alloc] init];
    joe.right = rick;
    XCTAssertEqualObjects(rick, joe.right);
    
    expectedDescription = @"Joe, 0, 0, left.value: Larry, right.value: (null)";
    XCTAssertEqualObjects(expectedDescription, [joe description]);
    
    rick.value = @"Rick";
    expectedDescription = @"Joe, 0, 0, left.value: Larry, right.value: Rick";
    XCTAssertEqualObjects(expectedDescription, [joe description]);
}

- (void)testDesignatedInitializerIndexesNil {
    NSString *value = @"Joe";
    BSNode *larry = [[BSNode alloc] init];
    BSNode *rick = [[BSNode alloc] init];
    BSNode *joe = [[BSNode alloc] initWithValue:value index0:0 index1:0 left:larry right:rick];
    
    XCTAssertNotNil(joe);
    XCTAssertEqualObjects(value, joe.value);
    XCTAssertEqualObjects(larry, joe.left);
    XCTAssertEqualObjects(rick, joe.right);
}

- (void)testDesignatedInitializer {
    NSString *value = @"Joe";
    NSInteger index0 = 2;
    NSInteger index1 = 0;
    BSNode *larry = [[BSNode alloc] init];
    BSNode *rick = [[BSNode alloc] init];
    BSNode *joe = [[BSNode alloc] initWithValue:value index0:index0 index1:index1 left:larry right:rick];
    
    XCTAssertNotNil(joe);
    XCTAssertEqualObjects(value, joe.value);
    XCTAssertEqual(index0, joe.index0);
    XCTAssertEqual(index1, joe.index1);
    XCTAssertEqualObjects(larry, joe.left);
    XCTAssertEqualObjects(rick, joe.right);
}

@end
