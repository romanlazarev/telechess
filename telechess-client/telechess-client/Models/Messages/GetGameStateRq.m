//
//  GetGameStateRq.m
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "GetGameStateRq.h"

@implementation GetGameStateRq
@synthesize gameId;

static NSString *const METHOD_URL = @"/getGameState";

- (instancetype)initWithGameId:(NSString *)gameId
{
    self = [super init];
    if (self) {
        gameId = gameId;
    }
    return self;
}

- (NSDictionary *)dictionary {
    return @{ @"gameId": [self gameId] };
}

+ (NSString *)methodUrl {
    return METHOD_URL;
}
@end
