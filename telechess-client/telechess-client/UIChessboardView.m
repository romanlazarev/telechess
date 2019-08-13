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
        [self initInternals];
    }
    return self;
}

- (void) initInternals{
    self.boxBorderColor = [UIColor darkGrayColor];
    
    self.blackKingImage = [UIImage imageNamed:@"black_king"];
    self.blackQueenImage = [UIImage imageNamed:@"black_queen"];
    self.blackBishopImage = [UIImage imageNamed:@"black_bishop"];
    self.blackKnightImage = [UIImage imageNamed:@"black_knight"];
    self.blackRookImage = [UIImage imageNamed:@"black_rook"];
    self.blackPawnImage = [UIImage imageNamed:@"black_pawn"];
    
    self.whiteKingImage = [UIImage imageNamed:@"white_king"];
    self.whiteQueenImage = [UIImage imageNamed:@"white_queen"];
    self.whiteBishopImage = [UIImage imageNamed:@"white_bishop"];
    self.whiteKnightImage = [UIImage imageNamed:@"white_knight"];
    self.whiteRookImage = [UIImage imageNamed:@"white_rook"];
    self.whitePawnImage = [UIImage imageNamed:@"white_pawn"];
    
    self.backgroundColor = [UIColor clearColor];
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
    
    for(NSInteger pawn = 0; pawn < 8; pawn ++) {
        //[self.blackPawnImage drawInRect:CGRectMake(2+pawn*cellSize, cellSize, cellSize, cellSize)];
        [self addSubview:[[UIChessPiece alloc] initWithImage:self.blackPawnImage andRect:CGRectMake(2+pawn*cellSize, cellSize, cellSize, cellSize)]];
        
    }
    
    for(NSInteger pawn = 0; pawn < 8; pawn ++) {
        [self addSubview:[[UIChessPiece alloc] initWithImage:self.whitePawnImage andRect:CGRectMake(2+pawn*cellSize, cellSize*6, cellSize, cellSize)]];
        //[self.whitePawnImage drawInRect:CGRectMake(2+pawn*cellSize, cellSize*6, cellSize, cellSize)];
    }
    
}

@end
