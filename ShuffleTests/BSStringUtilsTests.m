//
//  BSStringUtilsTests.m
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BSStringUtils.h"

@interface BSStringUtilsTests : XCTestCase

@end

@implementation BSStringUtilsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsStringNilOrEmpty {
    XCTAssertTrue([BSStringUtils isStringNilOrEmpty:nil]);
    XCTAssertTrue([BSStringUtils isStringNilOrEmpty:@""]);

    XCTAssertFalse([BSStringUtils isStringNilOrEmpty:@"B"]);
}

@end
