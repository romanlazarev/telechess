//
//  UIChessboardViewController.h
//  telechess-client
//
//  Created by Roman Lazarev on 12/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIChessboardView.h"
#import "../Models/ChessboardModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIChessboardViewController : UIViewController

/*@property UIImage *blackKingImage;
@property UIImage *blackQueenImage;
@property UIImage *blackBishopImage;
@property UIImage *blackKnightImage;
@property UIImage *blackRookImage;
@property UIImage *blackPawnImage;

@property UIImage *whiteKingImage;
@property UIImage *whiteQueenImage;
@property UIImage *whiteBishopImage;
@property UIImage *whiteKnightImage;
@property UIImage *whiteRookImage;
@property UIImage *whitePawnImage;*/

@property ChessboardModel *chessboardModel;

//@property UIChessboardView view
//@property (readonly, getter=getView) UIChessboardView *view;
//@property IBOutlet UIChessboardView *chessView;

- (UIChessboardView *)view;

@end

NS_ASSUME_NONNULL_END
