//
//  FibonacciNumberTableViewCell.h
//  InfiniteFibonacci
//
//  Created by Sean Wertheim on 5/28/15.
//  Copyright (c) 2015 Sean Wertheim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FibonacciNumberTableViewCell : UITableViewCell

#pragma mark - Initializers

+ (instancetype)cellWithNumberString:(NSString*)fibonacciNumber;

#pragma mark - TableView Datasource Helpers

+ (NSString *)reuseIdentifier;
+ (CGFloat)height;

@end
