//
//  GetGameStateRs.m
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "GetGameStateRs.h"

@implementation GetGameStateRs
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

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self.gameId = [dictionary valueForKey:@"gameId"];
    self.state = [[dictionary valueForKey:@"state"] unsignedIntegerValue];
    self.playerAName = [dictionary valueForKey:@"playerAName"];
    self.playerBName = [dictionary valueForKey:@"playerBName"];
    self.currMove = [dictionary valueForKey:@"currMove"];
    self.createdMs = [[dictionary valueForKey:@"createdMs"] unsignedIntegerValue];
    self.startedMs = [[dictionary valueForKey:@"startedMs"] unsignedIntegerValue];
    self.lastAMoveMs = [[dictionary valueForKey:@"lastAMoveMs"] unsignedIntegerValue];
    self.lastBMoveMs = [[dictionary valueForKey:@"lastBMoveMs"] unsignedIntegerValue];
    self.finishedMs = [[dictionary valueForKey:@"finishedMs"] unsignedIntegerValue];
    self.winner = [dictionary valueForKey:@"winner"];
    self.looser = [dictionary valueForKey:@"looser"];
    self.isTechWin = [[dictionary valueForKey:@"isTechWin"] boolValue];
    
    return self;
}
@end
