//
//  ChessPieceModel.m
//  telechess-client
//
//  Created by Roman Lazarev on 11/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "ChessPiece.h"

@implementation ChessPiece

@synthesize side;
@synthesize type;
@synthesize position;


-(id)initWithType:(CPType)aType andSide:(CPSide)aSide {
    self = [super init];
    if(self) {
        type = aType;
        side = aSide;
    }
    return self;
}

- (id)initWithType:(CPType)type andSide:(CPSide)side andPosition:(struct CPPosition)pos {
    self = [self initWithType:type andSide:side];
    if(self) {
        position = pos;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"type: %lu, side: %lu, row: %li, col: %li", type, side, position.row, position.col];
}

@end
