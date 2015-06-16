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

@end
