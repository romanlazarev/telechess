//
//  LookForGameRs.m
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "LookForGameRs.h"

@implementation LookForGameRs {
    NSDictionary * _dictionary;
}
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
@synthesize pieces;
@synthesize side;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    gameId = [dictionary valueForKey:@"gameId"];
    state = [[dictionary valueForKey:@"state"] unsignedIntegerValue];
    
    playerAName = [dictionary valueForKey:@"playerAName"];
    playerBName = [dictionary valueForKey:@"playerBName"];
    currMove = [dictionary valueForKey:@"currMove"];
    createdMs = [[dictionary valueForKey:@"createdMs"] unsignedIntegerValue];
    startedMs = [[dictionary valueForKey:@"startedMs"] unsignedIntegerValue];
    lastAMoveMs = [[dictionary valueForKey:@"lastAMoveMs"] unsignedIntegerValue];
    lastBMoveMs = [[dictionary valueForKey:@"lastBMoveMs"] unsignedIntegerValue];
    finishedMs = [[dictionary valueForKey:@"finishedMs"] unsignedIntegerValue];
    winner = [dictionary valueForKey:@"winner"];
    looser = [dictionary valueForKey:@"looser"];
    isTechWin = [[dictionary valueForKey:@"isTechWin"] boolValue];

    pieces = [dictionary mutableArrayValueForKey:@"pieces"];
    side = [[dictionary valueForKey:@"side"] unsignedIntegerValue];
    
    _dictionary = dictionary;
    return self;
}

- (NSDictionary *)dictionary {
    return _dictionary;
}
@end
