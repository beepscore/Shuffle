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

/** Contains values of nodes visited.
 Useful during development for examining traversal history.
 */
@property (strong, nonatomic) NSArray *nodesSearched;

-(BOOL) isNodeValue:(BSNode *)node equalToValue:(NSString *)value;

@end
