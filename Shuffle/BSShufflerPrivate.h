//
//  BSShufflerPrivate.h
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//

#import "BSShuffler.h"

/// Expose properties for use by unit tests
/// Declare "private" methods for use by unit tests.
/// Use extension () instead of category (Tests) and import into .m file
/// This way, compiler checks for incomplete implementation
/// Reference
/// http://stackoverflow.com/questions/1098550/unit-testing-of-private-methods-in-xcode
/// http://lisles.net/accessing-private-methods-and-properties-in-objc-unit-tests/

@interface BSShuffler()

typedef enum {
    kShuffleValidityUnknown = -1,
    kShuffleNotValid = 0,
    kShuffleValid = 1,
} ShuffleValidityCode;

/** Contains values of nodes visited.
 Useful during development for examining traversal history.
 */
@property (strong, nonatomic) NSArray *nodesSearched;

- (BOOL)isNodeValue:(BSNode *)node equalToValue:(NSString *)value;

- (BOOL)isNode:(BSNode *)node index0AtEndOfString:(NSString *)string;

- (BOOL)isNode:(BSNode *)node index1AtEndOfString:(NSString *)string;

/**
 * Checks several edge cases such as arguments null or empty strings
 * Returns ShuffleValidityCode instead of boolean (true, false)
 * @param shuffledString
 * @param string0
 * @param string1
 * @return kShuffleValid if shuffledString is a valid shuffle of string0 and string1.
 * return kShuffleNotValid if shuffledString is not a valid shuffle of string0 and string1.
 * return kShuffleValidityUnknown if method can't tell if shuffledString is a valid shuffle of string0 and string1.
 */
- (ShuffleValidityCode)isValidShuffleForEdgeCases:(NSString *)shuffledString
                                          string0:(NSString *)string0
                                          string1:(NSString *)string1;

/**
 *
 * @param node may not be nil.
 * @param string0 may be nil or empty @"".
 * @param string1 may be nil or empty @"".
 * @return YES if node index0 and index1 are at end of string0 and string1
 */
- (BOOL)isLeafNode:(BSNode *)node
           string0:(NSString *)string0
           string1:(NSString *)string1;

@end
