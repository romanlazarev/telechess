//
//  SetGameStateRq.m
//  telechess-client
//
//  Created by Roman Lazarev on 25/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "SetGameStateRq.h"

@implementation SetGameStateRq
@synthesize userToken;
@synthesize gameId;

static NSString *const METHOD_URL = @"/setGameState";

- (instancetype)initWithUserToken:(NSString*)token andGameId:(NSString *)game
{
    self = [super init];
    if (self) {
        userToken = token;
        gameId = game;
    }
    return self;
}

- (NSDictionary *)dictionary {
    return @{ @"UserToken": [self userToken], @"gameId": [self gameId] };
}

+ (NSString *)methodUrl {
    return METHOD_URL;
}
@end
