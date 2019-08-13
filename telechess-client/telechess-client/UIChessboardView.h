//
//  UIChessboardView.h
//  telechess-client
//
//  Created by Roman Lazarev on 07/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface UIChessboardView: UIView
@property UIColor *boxBorderColor;

@property UIImage *blackKingImage;
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
@property UIImage *whitePawnImage;

@end

NS_ASSUME_NONNULL_END
