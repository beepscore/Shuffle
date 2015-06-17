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
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    XCTAssertTrue([shuffler isNodeValue:nil equalToValue:nil]);
}

- (void)testIsNodeIndex0AtEndOfString {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    BSNode *node = [[BSNode alloc] initWithValue:@"foo"
                                          index0:@2
                                          index1:nil
                                            left:nil
                                           right:nil];
    XCTAssertTrue([shuffler isNode:node index0AtEndOfString:@"abc"]);
    XCTAssertTrue([shuffler isNode:node index0AtEndOfString:@""]);

    XCTAssertFalse([shuffler isNode:node index0AtEndOfString:@"ab"]);
    XCTAssertFalse([shuffler isNode:node index0AtEndOfString:@"abcd"]);
}

- (void)testIsNodeIndex1AtEndOfString {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    BSNode *node = [[BSNode alloc] initWithValue:@"foo"
                                          index0:nil
                                          index1:@3
                                            left:nil
                                           right:nil];
    XCTAssertFalse([shuffler isNode:node index1AtEndOfString:@"abc"]);
    XCTAssertTrue([shuffler isNode:node index1AtEndOfString:@""]);

    XCTAssertFalse([shuffler isNode:node index1AtEndOfString:@"ab"]);
    XCTAssertTrue([shuffler isNode:node index1AtEndOfString:@"abcd"]);
}

//==========================================================================

- (void)testIsValidShuffleForEdgeCasesShuffledStringNil {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    XCTAssertEqual(kShuffleValid,
                   [shuffler isValidShuffleForEdgeCases:nil
                                                string0:nil
                                                string1:nil]);
    
    XCTAssertEqual(kShuffleNotValid,
                   [shuffler isValidShuffleForEdgeCases:nil
                                                string0:@"a"
                                                string1:nil]);
    
    XCTAssertEqual(kShuffleNotValid,
                   [shuffler isValidShuffleForEdgeCases:nil
                                                string0:nil
                                                string1:@"b"]);
    
    XCTAssertEqual(kShuffleNotValid,
                   [shuffler isValidShuffleForEdgeCases:nil
                                                string0:@"a"
                                                string1:@"b"]);
}

- (void)testIsValidShuffleForEdgeCasesShuffledStringEmpty {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    XCTAssertEqual(kShuffleNotValid,
                   [shuffler isValidShuffleForEdgeCases:@""
                                                string0:nil
                                                string1:nil]);

    XCTAssertEqual(kShuffleNotValid,
                   [shuffler isValidShuffleForEdgeCases:@""
                                                string0:@"a"
                                                string1:nil]);

    XCTAssertEqual(kShuffleNotValid,
                   [shuffler isValidShuffleForEdgeCases:@""
                                                string0:nil
                                                string1:@"xy"]);

    XCTAssertEqual(kShuffleNotValid,
                   [shuffler isValidShuffleForEdgeCases:@""
                                                string0:@"a"
                                                string1:@"b"]);
}

- (void)testIsValidShuffleForEdgeCasesSourceStringNil {
    BSShuffler *shuffler = [[BSShuffler alloc] init];
    
    XCTAssertEqual(kShuffleValid,
                   [shuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:@"abc"
                                                string1:nil]);
    XCTAssertEqual(kShuffleValid,
                   [shuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:nil
                                                string1:@"abc"]);

    XCTAssertEqual(kShuffleNotValid,
                   [shuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:nil
                                                string1:nil]);

    XCTAssertEqual(kShuffleValidityUnknown,
                   [shuffler isValidShuffleForEdgeCases:@"a"
                                                string0:nil
                                                string1:@"ab"]);

    XCTAssertEqual(kShuffleValidityUnknown,
                   [shuffler isValidShuffleForEdgeCases:@"ab"
                                                string0:nil
                                                string1:@"abc"]);
    XCTAssertEqual(kShuffleValidityUnknown,
                   [shuffler isValidShuffleForEdgeCases:@"abc"
                                                string0:nil
                                                string1:@"ab"]);
}


@end
