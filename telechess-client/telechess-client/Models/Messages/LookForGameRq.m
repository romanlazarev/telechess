//
//  LookForGameRq.m
//  telechess-client
//
//  Created by Roman Lazarev on 18/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "LookForGameRq.h"

@implementation LookForGameRq
@synthesize userToken;

static NSString *const METHOD_URL = @"/lookForGame";

- (instancetype)initWithUserToken:(NSString*)token;
{
    self = [super init];
    if (self) {
        userToken = token;
    }
    return self;
}

- (NSDictionary *)dictionary {
    return @{ @"userToken": [self userToken] };
}

+ (NSString *)methodUrl {
    return METHOD_URL;
}

@end
