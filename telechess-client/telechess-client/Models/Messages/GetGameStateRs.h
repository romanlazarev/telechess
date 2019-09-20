//
//  GetGameStateRs.h
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetGameStateRs : Message
@property NSString *gameId;
@property NSUInteger state;
@property NSString *playerAName;
@property NSString *playerBName;
@property NSString *currMove;
@property NSUInteger createdMs;
@property NSUInteger startedMs;
@property NSUInteger lastAMoveMs;
@property NSUInteger lastBMoveMs;
@property NSUInteger finishedMs;
@property NSString *winner;
@property NSString *looser;
@property BOOL isTechWin;

@end

NS_ASSUME_NONNULL_END
