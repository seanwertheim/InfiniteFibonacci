//
//  FibonacciNumberTableViewCell.h
//  InfiniteFibonacci
//
//  Created by Sean Wertheim on 5/28/15.
//  Copyright (c) 2015 Sean Wertheim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JKBigInteger/JKBigInteger.h>

@interface FibonacciNumberTableViewCell : UITableViewCell

#pragma mark - Initializers

/**
 *  Initializes a cell with a given Fibonacci number.  The cell's label line breaks by character wrapping.
 *
 *  @param fibonacciNumber The number the cell displays.
 *
 *  @return an initialized cell with the given Fibonacci number
 */
+ (instancetype)cellWithNumberString:(JKBigInteger *)fibonacciNumber;

#pragma mark - TableView Datasource Helpers

/**
 *  The cell's reuse identifier.
 *
 *  @return the reuse identifier.
 */
+ (NSString *)reuseIdentifier;

/**
 *  The cell's estimated height.
 *
 *  @return the estimated height.
 */
+ (CGFloat)estimatedHeight;

@end
