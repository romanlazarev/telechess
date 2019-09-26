//
//  UIChessboardView.h
//  telechess-client
//
//  Created by Roman Lazarev on 07/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChessPiece.h"

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface UIChessboardView: UIView
@property IBInspectable UIColor *boxBorderColor;


@property (nonatomic, readonly) BOOL isVertical;
@property (nonatomic, readonly) CGRect boardRect;

//@property (readonly) CGFloat boardOffsetX;
//@property (readonly) CGFloat boardOffsetY;
//@property (readonly) CGFloat boardWidth;
//@property (readonly) CGFloat boardHeight;

@property (nonatomic, readonly) CGFloat cellSize;
//@property (readonly) CGFloat minimumSide;

- (ChessPiece*)chessPieceInPoint:(CGPoint)point;


@end

NS_ASSUME_NONNULL_END
