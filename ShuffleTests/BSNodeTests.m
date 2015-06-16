//
//  BSNodeTest.m
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BSNode.h"

@interface BSNodeTests : XCTestCase

@end

@implementation BSNodeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNodePropertiesNil {

    BSNode *node = [[BSNode alloc] init];
    XCTAssertNotNil(node);

    XCTAssertNil(node.value);
    XCTAssertNil(node.index0);
    XCTAssertNil(node.index1);
    XCTAssertNil(node.left);
    XCTAssertNil(node.right);
}

- (void)testNodeDescriptionPropertiesNil {
    BSNode *node = [[BSNode alloc] init];
    NSString *expected = @"nil, nil, nil, left: nil, right: nil";
    XCTAssertEqualObjects(expected, [node description]);
}

- (void)testNodeProperties {
    BSNode *joe = [[BSNode alloc] init];
    
    NSString *testValue = @"Joe";
    joe.value = testValue;
    XCTAssertEqualObjects(testValue, joe.value);
    
    NSString *expectedDescription = @"Joe, nil, nil, left: nil, right: nil";
    XCTAssertEqualObjects(expectedDescription, [joe description]);
    
    BSNode *larry = [[BSNode alloc] init];
    joe.left = larry;
    larry.value = @"Larry";
    XCTAssertEqualObjects(larry, joe.left);
    
    expectedDescription = @"Joe, nil, nil, left.value: Larry, right: nil";
    NSString *actual = [NSString stringWithFormat:@"%@", joe];
    XCTAssertEqualObjects(expectedDescription, actual);
    
    BSNode *rick = [[BSNode alloc] init];
    joe.right = rick;
    XCTAssertEqualObjects(rick, joe.right);
    
    expectedDescription = @"Joe, nil, nil, left.value: Larry, right.value: (null)";
    XCTAssertEqualObjects(expectedDescription, [joe description]);
    
    rick.value = @"Rick";
    expectedDescription = @"Joe, nil, nil, left.value: Larry, right.value: Rick";
    XCTAssertEqualObjects(expectedDescription, [joe description]);
}

- (void)testDesignatedInitializerIndexesNil {
    NSString *value = @"Joe";
    BSNode *larry = [[BSNode alloc] init];
    BSNode *rick = [[BSNode alloc] init];
    BSNode *joe = [[BSNode alloc] initWithValue:value index0:nil index1:nil left:larry right:rick];
    
    XCTAssertNotNil(joe);
    XCTAssertEqualObjects(value, joe.value);
    XCTAssertEqualObjects(larry, joe.left);
    XCTAssertEqualObjects(rick, joe.right);
}

- (void)testDesignatedInitializer {
    NSString *value = @"Joe";
    NSNumber *index0 = @2;
    BSNode *larry = [[BSNode alloc] init];
    BSNode *rick = [[BSNode alloc] init];
    BSNode *joe = [[BSNode alloc] initWithValue:value index0:index0 index1:nil left:larry right:rick];
    
    XCTAssertNotNil(joe);
    XCTAssertEqualObjects(value, joe.value);
    XCTAssertEqualObjects(index0, joe.index0);
    XCTAssertEqualObjects(larry, joe.left);
    XCTAssertEqualObjects(rick, joe.right);
}

@end
