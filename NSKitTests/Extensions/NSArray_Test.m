//
//  NSArray_Test.m
//  NSKit
//
//  Created by Patrick Chamelo on 6/24/13.
//  Copyright (c) 2013 Patrick Chamelo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import <XCTest/XCTest.h>
#import "NSArray+NSKitExtensions.h"
#import "NSMutableArray+NSKitExtensions.h"


// ------------------------------------------------------------------------------------------


@interface NSArray_Test : XCTestCase @end


// ------------------------------------------------------------------------------------------


@implementation NSArray_Test


// ------------------------------------------------------------------------------------------
#pragma mark - Tests
// ------------------------------------------------------------------------------------------
- (void)testReverseArray
{
    NSArray *array = @[@(1), @(2), @(3), @(4)];
    NSArray *reversedArray = [array nskit_reversedArray];
    
    XCTAssertTrue(array.count == reversedArray.count, @"Count is not the same");

    NSUInteger count = array.count;
    for (NSNumber *num in reversedArray)
    {
        XCTAssertTrue([num isEqualTo:[array objectAtIndex:--count]], @"Object at %lu index is wrong", (unsigned long)count);
    }
}


- (void)testReverseMutableArray
{
    NSMutableArray *reversedArray = [NSMutableArray arrayWithArray:@[@(1), @(2), @(3), @(4)]];
    NSMutableArray *array = [reversedArray copy];
    [reversedArray nskit_reverse];
    
    XCTAssertTrue(array.count == reversedArray.count, @"Count is not the same");
    
    NSUInteger count = array.count;
    for (NSNumber *num in reversedArray)
    {
        XCTAssertTrue([num isEqualTo:[array objectAtIndex:--count]], @"Object at %lu index is wrong", (unsigned long)count);
    }
}


@end