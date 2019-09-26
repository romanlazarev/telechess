//
//  UIChessboardViewController.m
//  telechess-client
//
//  Created by Roman Lazarev on 12/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "UIChessboardViewController.h"
#import "UIChessPiece.h"
#import "GameService.h"

@interface UIChessboardViewController ()

@end

@implementation UIChessboardViewController {
    BOOL _updatingCycleIsActive;
}

@synthesize chessboardModel;

- (void)loadView {
    [super loadView];
    self.view.boxBorderColor = [UIColor darkGrayColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initInternals];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startUpdateGame];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self stopUpdateGame];
}

- (void)startUpdateGame {
    if(_updatingCycleIsActive)
        return;
    
    _updatingCycleIsActive = NO;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSInteger updates = 0;
        GameService *gs = [GameService sharedInstance];
        while (self->_updatingCycleIsActive || gs.isInGame) {
            updates++;
            NSLog(@"Update number: %ld", updates);
            [gs getRemoteGameState];
            [NSThread sleepForTimeInterval:2.f];
        }
        self->_updatingCycleIsActive = NO;
    });
}

- (void)stopUpdateGame {
    _updatingCycleIsActive = NO;
}

- (void)initInternals {
    self.chessboardModel = [[ChessboardModel alloc] init];
    
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

    
    CGFloat cellSize = self.view.cellSize;
    for(NSUInteger row=0; row<8; row++) {
        for(NSUInteger col=0; col<8; col++) {
            ChessPiece* piece = [chessboardModel getPieceByX:col andY:row];
            if(piece != NULL) {
                UIChessPiece* subview = [[UIChessPiece alloc]
                                         initWithImage:[self getImageByType:piece.type andSide:piece.side]
                                         andRect:CGRectMake(2+row*cellSize, col*cellSize, cellSize, cellSize)];
                [self.view addSubview:subview];
            }
        }
    }
}

- (UIChessboardView*) getView {
    return (UIChessboardView*)super.view;
}

- (IBAction)chessboardTapped:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"Detected tap: x=%f, y=%f", location.x, location.y);
}

-(UIImage*)getImageByType:(CPType)type andSide:(CPSide)side {
    if(side == kWhiteSide) {
        switch (type) {
            case kPawn:
                return self.whitePawnImage;
            case kRook:
                return self.whiteRookImage;
            case kKnight:
                return self.whiteKnightImage;
            case kBishop:
                return self.whiteBishopImage;
            case kKing:
                return self.whiteKingImage;
            case kQueen:
                return self.whiteQueenImage;
        }
    } else if(side == kBlackSide) {
        switch (type) {
            case kPawn:
                return self.blackPawnImage;
            case kRook:
                return self.blackRookImage;
            case kKnight:
                return self.blackKnightImage;
            case kBishop:
                return self.blackBishopImage;
            case kKing:
                return self.blackKingImage;
            case kQueen:
                return self.blackQueenImage;
        }
    }
    return NULL;
}

@end
