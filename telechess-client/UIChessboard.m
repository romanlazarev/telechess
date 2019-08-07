//
//  UIChessboard.m
//  telechess-client
//
//  Created by Roman Lazarev on 07/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "UIChessboard.h"

@implementation UIChessboard
    
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self initInternals];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [self initInternals];
    }
    return self;
}

- (void) initInternals{
    self.boxBorderColor = [UIColor darkGrayColor];
    //self.backgroundColor = [UIColor blackColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // draw border
    NSLog(@"width:%f; height:%f ", self.frame.size.width, self.frame.size.height);
    
    // get minimum side and normalize it
    CGFloat minimum = self.frame.size.width;
    if(self.frame.size.height < minimum) {
        minimum = self.frame.size.height;
    }
    minimum = minimum - 4;
    
    CGFloat cellSize = minimum/8;
    for(NSInteger row = 0; row < 8; row++) {
        for(NSInteger col = 0; col < 8; col++) {
            UIBezierPath *boxPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(2+cellSize*col, 2+cellSize*row, cellSize, cellSize) cornerRadius:0];
            
            boxPath.lineWidth = 1;
            [_boxBorderColor setFill];
            [_boxBorderColor setStroke];
            
            if((col+row)%2 == 1) {
                [boxPath fill];
            }
            [boxPath stroke];
        }
    }
}


@end
