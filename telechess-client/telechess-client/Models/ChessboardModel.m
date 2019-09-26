//
//  ChessboardModel.m
//  telechess-client
//
//  Created by Roman Lazarev on 26/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "ChessboardModel.h"

@implementation ChessboardModel


-(id)init {
    self = [super init];
    if(self) {
        [self drop];
    }
    return self;
}

-(ChessPiece*)getPieceByX:(NSUInteger)x andY:(NSUInteger)y {
    return pieces[x][y];
}

-(void)drop {
    // init blacks
    pieces[0][0] = [[ChessPiece alloc] initWithType:kRook   andSide:kBlackSide];
    pieces[0][1] = [[ChessPiece alloc] initWithType:kKnight andSide:kBlackSide];
    pieces[0][2] = [[ChessPiece alloc] initWithType:kBishop andSide:kBlackSide];
    pieces[0][3] = [[ChessPiece alloc] initWithType:kQueen  andSide:kBlackSide];
    pieces[0][4] = [[ChessPiece alloc] initWithType:kKing   andSide:kBlackSide];
    pieces[0][5] = [[ChessPiece alloc] initWithType:kBishop andSide:kBlackSide];
    pieces[0][6] = [[ChessPiece alloc] initWithType:kKnight andSide:kBlackSide];
    pieces[0][7] = [[ChessPiece alloc] initWithType:kRook   andSide:kBlackSide];
    for(int i=0; i<8; i++) {
        pieces[1][i] = [[ChessPiece alloc] initWithType:kPawn andSide:kBlackSide];
    }
    
    // clean middle fields
    for(int i=2*8; i<64; i++) {
        pieces[i/8][i%8] = NULL;
    }
    
    //init whites
    pieces[7][7] = [[ChessPiece alloc] initWithType:kRook   andSide:kWhiteSide];
    pieces[7][6] = [[ChessPiece alloc] initWithType:kKnight andSide:kWhiteSide];
    pieces[7][5] = [[ChessPiece alloc] initWithType:kBishop andSide:kWhiteSide];
    pieces[7][4] = [[ChessPiece alloc] initWithType:kKing   andSide:kWhiteSide];
    pieces[7][3] = [[ChessPiece alloc] initWithType:kQueen  andSide:kWhiteSide];
    pieces[7][2] = [[ChessPiece alloc] initWithType:kBishop andSide:kWhiteSide];
    pieces[7][1] = [[ChessPiece alloc] initWithType:kKnight andSide:kWhiteSide];
    pieces[7][0] = [[ChessPiece alloc] initWithType:kRook   andSide:kWhiteSide];
    for(int i=0; i<8; i++) {
        pieces[6][i] = [[ChessPiece alloc] initWithType:kPawn andSide:kWhiteSide];
    }
}

@end
