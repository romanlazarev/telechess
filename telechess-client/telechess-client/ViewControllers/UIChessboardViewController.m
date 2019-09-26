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
#import "AppConstants.h"

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
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self view] setNeedsDisplay];
            });
            [NSThread sleepForTimeInterval:GET_REMOTE_GAME_STATE_INTERVAL_SEC];
        }
        self->_updatingCycleIsActive = NO;
    });
}

- (void)stopUpdateGame {
    _updatingCycleIsActive = NO;
}

- (void)initInternals {
    self.chessboardModel = [[ChessboardModel alloc] init];
}

- (UIChessboardView*) getView {
    return (UIChessboardView*)super.view;
}

- (IBAction)chessboardTapped:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    //NSLog(@"Detected tap: x=%f, y=%f", location.x, location.y);
    ChessPiece *cp = [[self view] chessPieceInPoint:location];
    if(cp) {
        NSLog(@"%@", cp);
    }
}

- (UIChessboardView *)view {
    return (UIChessboardView*)[super view];
}

@end
