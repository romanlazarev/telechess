//
//  CurrentStateRq.m
//  telechess-client
//
//  Created by Roman Lazarev on 18/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "CurrentStateRq.h"

@implementation CurrentStateRq
@synthesize userToken;

static NSString *const METHOD_URL = @"/currentState";

- (instancetype)initWithUserToken:(NSString*)userToken;
{
    self = [super init];
    if (self) {
        self.userToken = userToken;
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
