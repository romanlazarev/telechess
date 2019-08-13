//
//  UIChessPiece.h
//  telechess-client
//
//  Created by Roman Lazarev on 12/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIChessPiece : UIControl

@property UIImage *image;

-(id)initWithImage:(UIImage*)image andRect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
