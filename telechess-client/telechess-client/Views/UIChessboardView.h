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

@property (readonly) CGFloat cellSize;
@property (readonly) CGFloat minimumSide;

@end

NS_ASSUME_NONNULL_END
