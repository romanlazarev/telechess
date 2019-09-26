//
//  UIChessboardView.m
//  telechess-client
//
//  Created by Roman Lazarev on 07/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "UIChessboardView.h"
#import "UIChessPiece.h"
#import "GameService.h"

@implementation UIChessboardView {
    UIImage *_blackKingImage;
    UIImage *_blackQueenImage;
    UIImage *_blackBishopImage;
    UIImage *_blackKnightImage;
    UIImage *_blackRookImage;
    UIImage *_blackPawnImage;

    UIImage *_whiteKingImage;
    UIImage *_whiteQueenImage;
    UIImage *_whiteBishopImage;
    UIImage *_whiteKnightImage;
    UIImage *_whiteRookImage;
    UIImage *_whitePawnImage;
}

@synthesize isVertical;
@synthesize boardRect;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initImages];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        [self initImages];
    }
    return self;
}

/*- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        //[self initInternals];
    }
    return self;
}*/

- (void)initImages {
    _blackKingImage = [UIImage imageNamed:@"black_king"];
    _blackQueenImage = [UIImage imageNamed:@"black_queen"];
    _blackBishopImage = [UIImage imageNamed:@"black_bishop"];
    _blackKnightImage = [UIImage imageNamed:@"black_knight"];
    _blackRookImage = [UIImage imageNamed:@"black_rook"];
    _blackPawnImage = [UIImage imageNamed:@"black_pawn"];
    
    _whiteKingImage = [UIImage imageNamed:@"white_king"];
    _whiteQueenImage = [UIImage imageNamed:@"white_queen"];
    _whiteBishopImage = [UIImage imageNamed:@"white_bishop"];
    _whiteKnightImage = [UIImage imageNamed:@"white_knight"];
    _whiteRookImage = [UIImage imageNamed:@"white_rook"];
    _whitePawnImage = [UIImage imageNamed:@"white_pawn"];
}

- (void)handleLayout{
    NSLog(@"width:%f; height:%f ", self.frame.size.width, self.frame.size.height);
    // get minimum side and normalize it
    CGFloat minimum = self.frame.size.width;
    CGFloat maximum = self.frame.size.height;
    isVertical = YES;
    if(maximum < minimum) {
        minimum = self.frame.size.height;
        maximum = self.frame.size.width;
        isVertical = NO;
    }
    
    if(maximum < minimum*1.2f) {
        minimum = maximum/1.2f;
    }
    
    _cellSize = minimum/8;
    boardRect = CGRectMake(self.frame.size.width/2-minimum/2, self.frame.size.height/2-minimum/2, minimum, minimum);

    self.backgroundColor = [UIColor clearColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self handleLayout];
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    GameService *gs = [GameService sharedInstance];
    Game* game = gs.activeGame;
    
    // draw board
    for(NSInteger row = 0; row < 8; row++) {
        for(NSInteger col = 0; col < 8; col++) {
            CGRect cellRect = CGRectMake(_cellSize*col+boardRect.origin.x, _cellSize*row+boardRect.origin.y, _cellSize, _cellSize);
            UIBezierPath *boxPath = [UIBezierPath bezierPathWithRoundedRect:cellRect
                                      cornerRadius:0];
            
            boxPath.lineWidth = 1;
            [_boxBorderColor setFill];
            [_boxBorderColor setStroke];
            
            if((col+row)%2 == 1) {
                [boxPath fill];
            }
            [boxPath stroke];
            
            // Draw piece
            NSUInteger i = row*8+col;
            //NSLog(@"%lu",i);
            if(game && game.pieces && game.pieces.count > i) {
                NSUInteger cpType = [[game.pieces objectAtIndex:i] unsignedIntValue];
                UIImage *image = [self getImageByCode:cpType];
                if(image) {
                    [image drawInRect:cellRect];
                }
            }
        }
    }
}

- (ChessPiece *)chessPositionInPoint:(CGPoint)point {
    return nil;
}

- (ChessPiece *)chessPieceInPoint:(CGPoint)point {
    if( CGRectContainsPoint(boardRect, point) == NO) {
        return nil;
    }
    
    CGFloat x = point.x - boardRect.origin.x;
    CGFloat y = point.y - boardRect.origin.y;
    CPPosition pos;
    pos.col = -1;
    pos.row = -1;
    
    if(x < _cellSize) {
        pos.col = 0;
    } else {
        pos.col = x / _cellSize;
    }
    
    if(y < _cellSize) {
        pos.row = 0;
    } else {
        pos.row = y / _cellSize;
    }
    
    if(pos.col > -1 && pos.row > -1) {
        GameService *gs = [GameService sharedInstance];
        Game* game = gs.activeGame;
        
        NSUInteger i = pos.row*8+pos.col;
        NSUInteger rawType = [[game.pieces objectAtIndex:i] unsignedIntValue];
        CPType cpType = rawType;
        CPSide cpSide = kUndefinedSide;
                
        if (rawType > 10) {
            cpType = rawType-10;
            cpSide = kBlackSide;
        } else {
            cpSide = kWhiteSide;
        }
        ChessPiece *cp = [[ChessPiece alloc] initWithType:cpType andSide:cpSide andPosition:pos];
        return cp;
    }
    
    return nil;
}

- (UIImage*)getImageByCode:(NSUInteger)code {
    const NSUInteger blackCode = 10;
    
    switch (code) {
        case kPawn:
            return _whitePawnImage;
        case kRook:
            return _whiteRookImage;
        case kKnight:
            return _whiteKingImage;
        case kBishop:
            return _whiteBishopImage;
        case kQueen:
            return _whiteKingImage;
        case kKing:
            return _whiteKingImage;
        case kPawn+blackCode:
            return _blackPawnImage;
        case kRook+blackCode:
            return _blackRookImage;
        case kKnight+blackCode:
            return _blackKnightImage;
        case kBishop+blackCode:
            return _blackBishopImage;
        case kQueen+blackCode:
            return _blackQueenImage;
        case kKing+blackCode:
            return _blackKingImage;
        default:
            return nil;
    }
}

@end
