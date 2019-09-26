//
//  Game.h
//  telechess-client
//
//  Created by Roman Lazarev on 20/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Foundation/Foundation.h"
#import "Enums.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject

@property (nonatomic, copy, readonly) NSString *gameId;
@property (nonatomic, readonly) GameStateCode state;
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
@property (nonatomic, readonly) CPSide side;
@property (readonly, copy, readonly) NSArray *pieces;

- (instancetype)initWithId:(NSString*)aGameId
          andState:(GameStateCode)stateCode
    andPlayerAName:(NSString*)aName
    andPlayerBName:(NSString*)bName
       andCurrMove:(NSString*)move
       andCreateMs:(NSUInteger)aCreatedMs
      andStartedMs:(NSUInteger)aStartedMs
    andLastAMoveMs:(NSUInteger)lastAmove
    andLastBMoveMs:(NSUInteger)lastBmove
     andFinishedMs:(NSUInteger)aFinishedMs
         andWinner:(NSString*)winnerId
         andLooser:(NSString*)looserId
         andPieces:(NSArray*)aPieces;

- (instancetype)initWithDictionary:(NSDictionary*)dict;


- (void)updateWithOtherGame:(Game*)game;

@end

NS_ASSUME_NONNULL_END
