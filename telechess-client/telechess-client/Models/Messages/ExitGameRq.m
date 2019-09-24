//
//  ExitGameRq.m
//  telechess-client
//
//  Created by Roman Lazarev on 24/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "ExitGameRq.h"

@implementation ExitGameRq
@synthesize userToken;
@synthesize gameId;

static NSString *const METHOD_URL = @"/exitGame";

- (instancetype)initWithUserToken:(NSString *)token andGameId:(NSString *)game {
    self = [super init];
    if (self) {
        userToken = token;
        gameId = game;
    }
    return self;
}

- (NSDictionary *)dictionary {
    return @{ @"userToken": [self userToken], @"gameId": [self gameId] };
}

+ (NSString *)methodUrl {
    return METHOD_URL;
}
@end
