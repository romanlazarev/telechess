//
//  SetGameStateRs.h
//  telechess-client
//
//  Created by Roman Lazarev on 25/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface SetGameStateRs : Message
@property (nonatomic, copy, readonly) NSString *gameId;
@property (nonatomic, readonly) NSUInteger state;
@property (nonatomic, copy, readonly) NSString *playerAName;
@property (nonatomic, copy, readonly) NSString *playerBName;
@property (nonatomic, copy, readonly) NSString *currMove;
@property (nonatomic, readonly) NSUInteger createdMs;
@property (nonatomic, readonly) NSUInteger startedMs;
@property (nonatomic, readonly) NSUInteger lastAMoveMs;
@property (nonatomic, readonly) NSUInteger lastBMoveMs;
@property (nonatomic, readonly) NSUInteger finishedMs;
@property (nonatomic, copy, readonly) NSString *winner;
@property (nonatomic, copy, readonly) NSString *looser;
@property (nonatomic, readonly) BOOL isTechWin;
@property (nonatomic, copy, readonly) NSArray *pieces;
@property (nonatomic, readonly) NSUInteger side;

@end

NS_ASSUME_NONNULL_END
