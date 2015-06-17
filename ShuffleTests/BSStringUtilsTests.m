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

- (void)testSafeSubstringInclusiveStartIndexEndIndex {
    XCTAssertEqualObjects(@"a", [BSStringUtils safeSubstringInclusive:@"a" startIndex:0 endIndex:0]);
    XCTAssertEqualObjects(@"a", [BSStringUtils safeSubstringInclusive:@"a" startIndex:0 endIndex:9]);
    XCTAssertEqualObjects(@"a", [BSStringUtils safeSubstringInclusive:@"abc" startIndex:0 endIndex:0]);
    XCTAssertEqualObjects(@"b", [BSStringUtils safeSubstringInclusive:@"abc" startIndex:1 endIndex:1]);
    XCTAssertEqualObjects(@"ab", [BSStringUtils safeSubstringInclusive:@"abc" startIndex:0 endIndex:1]);
    XCTAssertEqualObjects(@" d", [BSStringUtils safeSubstringInclusive:@"ab d" startIndex:2 endIndex:3]);
}

- (void)testSafeSubstringLengthOneIndex {
    XCTAssertEqualObjects(@"a", [BSStringUtils safeSubstringLengthOne:@"a" index:0]);
    XCTAssertEqualObjects(@"a", [BSStringUtils safeSubstringLengthOne:@"abc" index:0]);
    XCTAssertEqualObjects(@"b", [BSStringUtils safeSubstringLengthOne:@"abc" index:1]);
    XCTAssertEqualObjects(@" ", [BSStringUtils safeSubstringLengthOne:@"ab d" index:2]);
    XCTAssertEqualObjects(@"d", [BSStringUtils safeSubstringLengthOne:@"ab d" index:3]);
}

- (void)testSafeSubstringLengthOneIndexStringNil {
    XCTAssertEqualObjects(@"", [BSStringUtils safeSubstringLengthOne:nil index:0]);
}

- (void)testSafeSubstringLengthOneIndexStringEmpty {
    XCTAssertEqualObjects(@"", [BSStringUtils safeSubstringLengthOne:@"" index:0]);
}

- (void)testSafeSubstringLengthOneIndexStringOutOfBounds {
    XCTAssertEqualObjects(@"", [BSStringUtils safeSubstringLengthOne:@"abc" index:-1]);
    XCTAssertEqualObjects(@"", [BSStringUtils safeSubstringLengthOne:@"abc" index:3]);
}

@end
