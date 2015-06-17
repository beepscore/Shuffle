//
//  BSStringUtils.h
//  Shuffle
//
//  Created by Steve Baker on 6/16/15.
//  Copyright (c) 2015 Beepscore LLC. All rights reserved.
//
// Could write these methods as a category on NSString instead.
// Use utility class, it is more easily discoverable by programmer.

#import <Foundation/Foundation.h>

@interface BSStringUtils : NSObject

+ (BOOL)isStringNilOrEmpty:(NSString *)string;

/** Method is "safe" in that it avoids out of bounds exceptions
 * Unlike NSString substringWithRange, range from startIndex to endIndex is inclusive.
 * @param aString
 * @param endIndex may be in middle, at end, or past end of aString.
 * @param startIndex
 * @return substring from startIndex to endIndex inclusive.
 *         return substring to endIndex if endIndex >= aString.length
 */
// TODO: After app is ported from Java AndroidShuffle, consider refactor/rename
// to more idiomatic Objective C. For example can change from startIndex, endIndex to an NSRange.
+(NSString *)safeSubstringInclusive:(NSString *)aString
                         startIndex:(NSInteger)startIndex
                           endIndex:(NSInteger)endIndex;

/** Method is "safe" in that it avoids out of bounds exceptions
 * @param aString
 * @param index
 * @return substring of length one at index.
 * return empty string "" if aString is null or empty or index is out of range.
 */
+(NSString *)safeSubstringLengthOne:(NSString *)aString
                              index:(NSInteger)index;

@end
