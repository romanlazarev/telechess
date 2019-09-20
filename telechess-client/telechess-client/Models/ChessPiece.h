//
//  ChessPieceModel.h
//  telechess-client
//
//  Created by Roman Lazarev on 11/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"


NS_ASSUME_NONNULL_BEGIN

@interface ChessPiece : NSObject
@property CPType type;
@property CPSide side;

-(id)initWithType:(CPType)type andSide:(CPSide)side;

@end

NS_ASSUME_NONNULL_END
