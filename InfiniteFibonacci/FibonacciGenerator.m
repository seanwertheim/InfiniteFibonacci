//
//  FibonacciGenerator.m
//  InfiniteFibonacci
//
//  Created by Sean Wertheim on 5/28/15.
//  Copyright (c) 2015 Sean Wertheim. All rights reserved.
//

#import "FibonacciGenerator.h"
#import <JKBigInteger/JKBigInteger.h>

static const NSUInteger kPageLength = 50;

@interface FibonacciGenerator ()

@property (strong, nonatomic) NSArray *allGeneratedNumbers;
@property (strong, nonatomic) NSArray *lastPage;

@property (assign, nonatomic) NSUInteger currentOffset;

@property (strong, nonatomic) dispatch_queue_t fibQueue;

@end

@implementation FibonacciGenerator

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.allGeneratedNumbers = [NSArray new];
        self.lastPage = [NSArray new];
        self.currentOffset = 0;
        self.fibQueue = dispatch_queue_create("com.-SeanWertheim.InfiniteFibonacci.fibQueue", NULL);
    }
    
    return self;
}

- (void)generateNewFibonacciPageWithOffset:(NSUInteger)offset {
    __weak typeof (self) weakSelf = self;
    
    dispatch_async(self.fibQueue, ^{
        typeof (self) strongSelf = weakSelf;
        
        NSArray *newPage = [strongSelf newFibonacciPageWithOffset:offset];
        
        [strongSelf cacheNewPage:newPage];
        
        dispatch_async(dispatch_get_main_queue(), ^{ //needs to be called on main thread so delegate can update ui
            if ([strongSelf.delegate respondsToSelector:@selector(fibonacciNumbersDidGenerate:)]) {
                [strongSelf.delegate fibonacciNumbersDidGenerate:strongSelf.lastPage];
            }           
        });
    });
}

- (NSArray *)newFibonacciPageWithOffset:(NSUInteger)offset {
    NSUInteger startIndex;
    NSUInteger endIndex;
    
    NSMutableArray *newPage = [[NSMutableArray alloc] initWithCapacity:kPageLength];
    
    JKBigInteger *first;
    JKBigInteger *second;
    
    if (offset == 0) {
        startIndex = 0;
        endIndex = kPageLength;
        
        first = [[JKBigInteger alloc] initWithUnsignedLong:0];
        second = [[JKBigInteger alloc] initWithUnsignedLong:1];
        
        [newPage addObjectsFromArray:@[first, second]];
    } else {
        startIndex = offset - 1;
        endIndex = startIndex + kPageLength;
        
        NSUInteger secondToLastIndex = [self.allGeneratedNumbers count] - 2;
        JKBigInteger *secondToLastGenerated = (JKBigInteger *)self.allGeneratedNumbers[secondToLastIndex];
        JKBigInteger *lastGenerated = (JKBigInteger *)[self.allGeneratedNumbers lastObject];
        
        first = secondToLastGenerated;
        second = lastGenerated;
    }
    
    for (; startIndex < endIndex; startIndex++) {
        JKBigInteger *fN = [first add:second];
        first = second;
        second = fN;
        
        [newPage addObject:fN];
    }
    
    return newPage;
}

- (void)cacheNewPage:(NSArray*)newPage {
    self.allGeneratedNumbers = [self.allGeneratedNumbers arrayByAddingObjectsFromArray:newPage];
    self.lastPage = newPage;
    self.currentOffset = self.allGeneratedNumbers.count;
}

- (void)generateNextPage {
    NSLog(@"\nGenerating next page.\n");
    
    [self generateNewFibonacciPageWithOffset:self.currentOffset];
}

@end
