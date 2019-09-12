//
//  UIChessboardView.m
//  telechess-client
//
//  Created by Roman Lazarev on 07/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "UIChessboardView.h"
#import "UIChessPiece.h"

@implementation UIChessboardView
    
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
        //[self initInternals];
    }
    return self;
}

- (void) initInternals{
    NSLog(@"width:%f; height:%f ", self.frame.size.width, self.frame.size.height);
    // get minimum side and normalize it
    CGFloat minimum = self.frame.size.width;
    if(self.frame.size.height < minimum) {
        minimum = self.frame.size.height;
    }
    _minimumSide = minimum - 4;
    _cellSize = minimum/8;

    self.backgroundColor = [UIColor clearColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // draw board
    for(NSInteger row = 0; row < 8; row++) {
        for(NSInteger col = 0; col < 8; col++) {
            UIBezierPath *boxPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_cellSize*col, _cellSize*row, _cellSize, _cellSize) cornerRadius:0];
            
            boxPath.lineWidth = 1;
            [_boxBorderColor setFill];
            [_boxBorderColor setStroke];
            
            if((col+row)%2 == 1) {
                [boxPath fill];
            }
            [boxPath stroke];
        }
    }
    
    return;
}

@end
