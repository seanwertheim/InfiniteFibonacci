//
//  FibonacciNumberTableViewCell.m
//  InfiniteFibonacci
//
//  Created by Sean Wertheim on 5/28/15.
//  Copyright (c) 2015 Sean Wertheim. All rights reserved.
//

#import "FibonacciNumberTableViewCell.h"

@interface FibonacciNumberTableViewCell ()

@end

@implementation FibonacciNumberTableViewCell

+(instancetype)cellWithNumberString:(NSString*)fibonacciNumber{
    FibonacciNumberTableViewCell *cell = [[FibonacciNumberTableViewCell alloc] initWithStyle:[FibonacciNumberTableViewCell cellStyle] reuseIdentifier:[FibonacciNumberTableViewCell reuseIdentifier]];
    
    cell.textLabel.text = fibonacciNumber;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByCharWrapping;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

+(NSString*)reuseIdentifier{
    return NSStringFromClass([self class]);
}

+ (UITableViewCellStyle)cellStyle {
    return UITableViewCellStyleDefault;
}

+(CGFloat)height{
    return 40;
}



@end
