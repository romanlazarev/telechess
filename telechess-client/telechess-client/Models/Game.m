//
//  Game.m
//  telechess-client
//
//  Created by Roman Lazarev on 20/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Game.h"

@implementation Game

@synthesize gameId;
@synthesize state;
@synthesize playerAName;
@synthesize playerBName;
@synthesize currMove;
@synthesize createdMs;
@synthesize startedMs;
@synthesize lastAMoveMs;
@synthesize lastBMoveMs;
@synthesize finishedMs;
@synthesize winner;
@synthesize looser;
@synthesize isTechWin;
@synthesize side;
@synthesize pieces;

- (instancetype)initWithId:(NSString *)aGameId andState:(GameStateCode)stateCode andPlayerAName:(NSString *)aName andPlayerBName:(NSString *)bName andCurrMove:(NSString *)move andCreateMs:(NSUInteger)aCreatedMs andStartedMs:(NSUInteger)aStartedMs andLastAMoveMs:(NSUInteger)lastAmove andLastBMoveMs:(NSUInteger)lastBmove andFinishedMs:(NSUInteger)aFinishedMs andWinner:(NSString *)winnerId andLooser:(NSString *)looserId andSide:(CPSide)aSide andPieces:(NSArray *)aPieces {
    self = [super init];
    if(self) {
        gameId = aGameId;
        state = stateCode;
        playerBName  = aName;
        playerBName = bName;
        currMove = move;
        createdMs = aCreatedMs;
        startedMs = aStartedMs;
        lastAMoveMs = lastAmove;
        lastBMoveMs = lastBmove;
        finishedMs = aFinishedMs;
        winner = winnerId;
        looser = looserId;
        side = aSide;
        pieces = aPieces;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary * _Nonnull)dict {
    self = [super init];
    if(self) {
       gameId = [dict valueForKey:@"gameId"];
       state = [[dict valueForKey:@"state"] unsignedIntegerValue];
       playerAName = [dict valueForKey:@"playerAName"];
       playerBName = [dict valueForKey:@"playerBName"];
       currMove = [dict valueForKey:@"currMove"];
       createdMs = [[dict valueForKey:@"createdMs"] unsignedIntegerValue];
       startedMs = [[dict valueForKey:@"startedMs"] unsignedIntegerValue];
       lastAMoveMs = [[dict valueForKey:@"lastAMoveMs"] unsignedIntegerValue];
       lastBMoveMs = [[dict valueForKey:@"lastBMoveMs"] unsignedIntegerValue];
       finishedMs = [[dict valueForKey:@"finishedMs"] unsignedIntegerValue];
       winner = [dict valueForKey:@"winner"];
       looser = [dict valueForKey:@"looser"];
       isTechWin = [[dict valueForKey:@"isTechWin"] boolValue];
       pieces = [dict mutableArrayValueForKey:@"pieces"];
       side = [[dict valueForKey:@"side"] unsignedIntegerValue];
    }
    return self;
}

- (void)updateWithOtherGame:(Game* _Nonnull)game {
    //gameId
    //state
    //playerAName
    //playerBName
    currMove = game.currMove;
    //createdMs = [[dict valueForKey:@"createdMs"] unsignedIntegerValue];
    startedMs = game.startedMs;
    lastAMoveMs = game.lastAMoveMs;
    lastBMoveMs = game.lastBMoveMs;
    finishedMs = game.finishedMs;
    winner = game.winner;
    looser = game.looser;
    isTechWin = game.isTechWin;
    pieces = game.pieces;
    side = game.side;
}

@end
