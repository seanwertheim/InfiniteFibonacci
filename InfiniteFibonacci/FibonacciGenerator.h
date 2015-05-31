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
- (void)fibonacciNumbersDidGenerate:(NSArray *)numbers;
@end

@interface FibonacciGenerator : NSObject


- (void)generateNextPage;

@property (nonatomic, weak) id<FibonacciGeneratorDelegate> delegate;

@end
