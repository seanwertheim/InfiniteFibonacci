//
//  InfiniteFibonacciTableViewController.m
//  InfiniteFibonacci
//
//  Created by Sean Wertheim on 5/28/15.
//  Copyright (c) 2015 Sean Wertheim. All rights reserved.
//

#import "InfiniteFibonacciTableViewController.h"
#import "FibonacciGenerator.h"
#import "FibonacciNumberTableViewCell.h"
#import <JKBigInteger/JKBigInteger.h>

static const NSUInteger kPreloadThreshold = 30;

@interface InfiniteFibonacciTableViewController () <FibonacciGeneratorDelegate>

@property (strong, nonatomic) FibonacciGenerator *fibonacciGenerator;
@property (strong, nonatomic) NSArray *numberList;

@end

@implementation InfiniteFibonacciTableViewController

#pragma mark - View Lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = NSLocalizedString(@"Infinite Fibonacci TableView", @"main tableview navigation item title");
    
    self.numberList = [NSArray new];
    
    self.fibonacciGenerator = [FibonacciGenerator new];
    self.fibonacciGenerator.delegate = self;
    [self.fibonacciGenerator generateNextPage];
    
    [self.tableView registerClass:[FibonacciNumberTableViewCell class] forCellReuseIdentifier:[FibonacciNumberTableViewCell reuseIdentifier]];
}

#pragma mark - UITableViewDataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKBigInteger *number = [self.numberList objectAtIndex:indexPath.row];
    return [FibonacciNumberTableViewCell cellWithNumberString:[number stringValue]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberList.count;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [FibonacciNumberTableViewCell height];
}

#pragma mark - UIScrollViewDelegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([self shouldGenerateNextPage]) {
        [self.fibonacciGenerator generateNextPage];
    }
}

#pragma mark - Private Helpers

- (BOOL)shouldGenerateNextPage {
    BOOL shouldGenerate = NO;
    
    for (NSIndexPath *indexPath in [self.tableView indexPathsForVisibleRows]) {
        if (indexPath.row >= [self.numberList count] - kPreloadThreshold) {
            shouldGenerate = YES;
        }
    }
    
    return shouldGenerate;
}

#pragma mark - FibonacciGeneratorDelegate methods

- (void)fibonacciNumbersDidGenerate:(NSArray *)numbers {
    self.numberList = [self.numberList arrayByAddingObjectsFromArray:numbers];
    [self.tableView reloadData];
}

@end
