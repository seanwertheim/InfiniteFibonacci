//
//  FibonacciGenerator.h
//  InfiniteFibonacci
//
//  Created by Sean Wertheim on 5/28/15.
//  Copyright (c) 2015 Sean Wertheim. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FibonacciGeneratorDelegate <NSObject>

@required

/**
 *  Called on the delegate when a new page of numbers is generated.
 *
 *  @param numbers The last page of Fibonacci numbers generated.
 */
- (void)fibonacciNumbersDidGenerate:(NSArray *)numbers;

@end

@interface FibonacciGenerator : NSObject

/**
 *  Generates the next page of Fibonacci numbers.
 */
- (void)generateNextPage;

/**
 *  Notified when a new page of numbers is generated. Generator sends the new numbers.
 */
@property (nonatomic, weak) id<FibonacciGeneratorDelegate> delegate;

@end
