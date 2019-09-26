//
//  ChessPieceModel.h
//  telechess-client
//
//  Created by Roman Lazarev on 11/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"
#import "CPPosition.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChessPiece : NSObject
@property (readonly) CPType type;
@property (readonly) CPSide side;
@property (readonly) struct CPPosition position;

-(id)initWithType:(CPType)type andSide:(CPSide)side;
-(id)initWithType:(CPType)type andSide:(CPSide)side andPosition:(struct CPPosition)pos;

@end

NS_ASSUME_NONNULL_END
