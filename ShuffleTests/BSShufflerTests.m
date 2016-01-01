//
//  BSShufflerTests.m
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BSShuffler.h"
#import "BSShufflerPrivate.h"
#import "BSNode.h"

@interface BSShufflerTests : XCTestCase

@end

@implementation BSShufflerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsNodeValueEqualToValue {
    XCTAssertTrue([BSShuffler isNodeValue:nil equalToValue:nil]);
}

- (void)testIsNodeIndex0AtEndOfString {
    BSNode *node = [[BSNode alloc] initWithValue:@"foo"
                                          index0:2
                                          index1:0
                                            left:nil
                                           right:nil];
    XCTAssertTrue([BSShuffler isNode:node index0AtEndOfString:@"abc"]);
    XCTAssertTrue([BSShuffler isNode:node index0AtEndOfString:@""]);

    XCTAssertFalse([BSShuffler isNode:node index0AtEndOfString:@"ab"]);
    XCTAssertFalse([BSShuffler isNode:node index0AtEndOfString:@"abcd"]);
}

- (void)testIsNodeIndex1AtEndOfString {
    BSNode *node = [[BSNode alloc] initWithValue:@"foo"
                                          index0:0
                                          index1:3
                                            left:nil
                                           right:nil];
    XCTAssertFalse([BSShuffler isNode:node index1AtEndOfString:@"abc"]);
    XCTAssertTrue([BSShuffler isNode:node index1AtEndOfString:@""]);

    XCTAssertFalse([BSShuffler isNode:node index1AtEndOfString:@"ab"]);
    XCTAssertTrue([BSShuffler isNode:node index1AtEndOfString:@"abcd"]);
}

- (void)testIsLeafNode {
    BSNode *node = [[BSNode alloc] initWithValue:@"a"
                                          index0:0
                                          index1:-1
                                            left:nil
                                           right:nil];
    XCTAssertFalse([BSShuffler isLeafNode:node
                                string0:@"a" string1:@"b"]);
}

//==========================================================================
#pragma mark - testIsValidShuffleForEdgeCases

- (void)testIsValidShuffleForEdgeCasesShuffledStringNil {

    XCTAssertEqual(BSShuffleValidityCodeValid,
                   [BSShuffler isValidShuffleForEdgeCases:nil
                                                string0:nil
                                                string1:nil]);
    
    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:nil
                                                string0:@"a"
                                                string1:nil]);
    
    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:nil
                                                string0:nil
                                                string1:@"b"]);
    
    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:nil
                                                string0:@"a"
                                                string1:@"b"]);
}

- (void)testIsValidShuffleForEdgeCasesShuffledStringEmpty {

    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:@""
                                                string0:nil
                                                string1:nil]);

    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:@""
                                                string0:@"a"
                                                string1:nil]);

    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:@""
                                                string0:nil
                                                string1:@"xy"]);

    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:@""
                                                string0:@"a"
                                                string1:@"b"]);
}

- (void)testIsValidShuffleForEdgeCasesSourceStringNil {

    XCTAssertEqual(BSShuffleValidityCodeValid,
                   [BSShuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:@"abc"
                                                string1:nil]);
    XCTAssertEqual(BSShuffleValidityCodeValid,
                   [BSShuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:nil
                                                string1:@"abc"]);

    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:nil
                                                string1:nil]);

    XCTAssertEqual(BSShuffleValidityCodeUnknown,
                   [BSShuffler isValidShuffleForEdgeCases:@"a"
                                                string0:nil
                                                string1:@"ab"]);

    XCTAssertEqual(BSShuffleValidityCodeUnknown,
                   [BSShuffler isValidShuffleForEdgeCases:@"ab"
                                                string0:nil
                                                string1:@"abc"]);
    XCTAssertEqual(BSShuffleValidityCodeUnknown,
                   [BSShuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:nil
                                                string1:@"ab"]);
}

- (void)testIsValidShuffleForEdgeCasesSourceStringEmpty {

    XCTAssertEqual(BSShuffleValidityCodeValid,
                   [BSShuffler isValidShuffleForEdgeCases:@""
                                                string0:@""
                                                string1:@""]);
    XCTAssertEqual(BSShuffleValidityCodeValid,
                   [BSShuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:@"abc"
                                                string1:@""]);
    XCTAssertEqual(BSShuffleValidityCodeValid,
                   [BSShuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:@""
                                                string1:@"abc"]);
    XCTAssertEqual(BSShuffleValidityCodeNotValid,
                   [BSShuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:@""
                                                string1:@""]);
}

//==========================================================================
#pragma mark - testIsValidShuffle

- (void)testIsValidShuffleShuffledStringNil {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    XCTAssertTrue([shuffler isValidShuffle:nil
                                  ofString:nil
                                withString:nil]);
    
    XCTAssertFalse([shuffler isValidShuffle:nil
                                  ofString:@"a"
                                withString:nil]);
    XCTAssertFalse([shuffler isValidShuffle:nil
                                   ofString:nil
                                 withString:@"b"]);
    XCTAssertFalse([shuffler isValidShuffle:nil
                                   ofString:@"a"
                                 withString:@"b"]);
}

- (void)testIsValidShuffleShuffledStringEmpty {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    XCTAssertFalse([shuffler isValidShuffle:@""
                                   ofString:nil
                                 withString:nil]);
    
    XCTAssertFalse([shuffler isValidShuffle:@""
                                   ofString:@"a"
                                 withString:nil]);
    
    XCTAssertFalse([shuffler isValidShuffle:@""
                                   ofString:nil
                                 withString:@"xy"]);
    
    XCTAssertFalse([shuffler isValidShuffle:@""
                                  ofString:@"a"
                                withString:@"b"]);
}

- (void)testIsValidShuffleSourceStringNil {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    XCTAssertTrue([shuffler isValidShuffle:@"abc"
                                  ofString:@"abc"
                                withString:nil]);
    
    XCTAssertTrue([shuffler isValidShuffle:@"abc"
                                  ofString:nil
                                withString:@"abc"]);

    XCTAssertFalse([shuffler isValidShuffle:@"abc"
                                   ofString:nil
                                 withString:nil]);

    XCTAssertFalse([shuffler isValidShuffle:@"abc"
                                   ofString:nil
                                 withString:@"ab"]);

    XCTAssertFalse([shuffler isValidShuffle:@"a"
                                   ofString:nil
                                 withString:@"ab"]);

    XCTAssertFalse([shuffler isValidShuffle:@"ab"
                                   ofString:nil
                                 withString:@"abc"]);
}

- (void)testIsValidShuffleSourceStringEmpty {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    XCTAssertTrue([shuffler isValidShuffle:@""
                                  ofString:@""
                                withString:@""]);
    XCTAssertTrue([shuffler isValidShuffle:@"abc"
                                  ofString:@"abc"
                                withString:@""]);
    XCTAssertTrue([shuffler isValidShuffle:@"abc"
                                  ofString:@""
                                withString:@"abc"]);
    
    XCTAssertFalse([shuffler isValidShuffle:@"abc"
                                   ofString:@""
                                 withString:@""]);
}

- (void)testIsValidShuffle {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    XCTAssertTrue([shuffler isValidShuffle:@"ab"
                                   ofString:@"a"
                                 withString:@"b"]);

    XCTAssertTrue([shuffler isValidShuffle:@"dabecf"
                                  ofString:@"abc"
                                withString:@"def"]);

    XCTAssertTrue([shuffler isValidShuffle:@"abcdefghijkl"
                                  ofString:@"abcghi"
                                withString:@"defjkl"]);

    XCTAssertFalse([shuffler isValidShuffle:@"abcdefghijkl"
                                   ofString:@"abchgi"
                                 withString:@"defjkl"]);
}

- (void)testIsValidShuffleLettersInCommon {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    // string0 and string1 contain letters in common
    XCTAssertTrue([shuffler isValidShuffle:@"abca"
                                  ofString:@"ac"
                                withString:@"ba"]);
    
    XCTAssertTrue([shuffler isValidShuffle:@"acbbca"
                                  ofString:@"abc"
                                withString:@"cba"]);
    
    XCTAssertTrue([shuffler isValidShuffle:@"abaabza"
                                  ofString:@"aba"
                                withString:@"abza"]);
    
    XCTAssertTrue([shuffler isValidShuffle:@"This is a great day indeed!"
                                  ofString:@"T reayde"
                                withString:@"hisis a gt da ined!"]);
    
    // expect false because strings are case sensitive
    XCTAssertFalse([shuffler isValidShuffle:@"This is a great day indeed!"
                                   ofString:@"t reayde"
                                 withString:@"hisis a gt da ined!"]);
}

- (void)testIsValidShuffleUTF8 {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    // Chinese from http://www.foxconn.com/index.html
    XCTAssertTrue([shuffler isValidShuffle:@"公告本公司董事會通過104年第一季合併"
                                  ofString:@"公司會0合"
                                withString:@"告本公董事通過14年第一季併"]);

    XCTAssertFalse([shuffler isValidShuffle:@"公告本公司董事會通過104年第一季合併"
                                  ofString:@"公司0合"
                                withString:@"會告本公董事通過14年第一季併"]);
}

@end
