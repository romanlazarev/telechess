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

-(id)initWithType:(CPType)type andSide:(CPSide)side {
    self = [super init];
    if(self) {
        self.type = type;
        self.side = side;
    }
    return self;
}

@end
