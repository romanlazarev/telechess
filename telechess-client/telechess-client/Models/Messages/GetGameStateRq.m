//
//  GetGameStateRq.m
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "GetGameStateRq.h"

@implementation GetGameStateRq
@synthesize userToken;
@synthesize gameId;

static NSString *const METHOD_URL = @"/getGameState";

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
