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

@end
