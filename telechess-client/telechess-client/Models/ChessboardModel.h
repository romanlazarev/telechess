//
//  ChessboardModel.h
//  telechess-client
//
//  Created by Roman Lazarev on 26/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChessPiece.h"


NS_ASSUME_NONNULL_BEGIN
@interface CPPosition
@property NSString *rowLetter;
@property NSInteger colNumber;
@property (readonly, getter=getX) NSInteger x;
@property (readonly, getter=getY) NSInteger y;
@end

@interface ChessboardModel : NSObject {
    ChessPiece* pieces[8][8];
}

-(id)init;
-(ChessPiece*)getPieceByX:(NSUInteger)x andY:(NSUInteger)y;
@end

NS_ASSUME_NONNULL_END
