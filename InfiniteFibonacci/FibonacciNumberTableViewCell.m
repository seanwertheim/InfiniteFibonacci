//
//  FibonacciNumberTableViewCell.m
//  InfiniteFibonacci
//
//  Created by Sean Wertheim on 5/28/15.
//  Copyright (c) 2015 Sean Wertheim. All rights reserved.
//

#import "FibonacciNumberTableViewCell.h"

static const UITableViewCellStyle kCellStyle = UITableViewCellStyleDefault;

@implementation FibonacciNumberTableViewCell

#pragma mark - Initializers

+ (instancetype)cellWithNumberString:(NSString *)fibonacciNumber {
    FibonacciNumberTableViewCell *cell = ({
        FibonacciNumberTableViewCell *cell = [[FibonacciNumberTableViewCell alloc] initWithStyle:kCellStyle reuseIdentifier:[self reuseIdentifier]];
        cell.textLabel.text = fibonacciNumber;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
        cell;
    });
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

#pragma mark - TableView Datasource Helpers

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (CGFloat)height {
    return 40;
}

@end
