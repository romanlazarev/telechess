//
//  RegisterDeviceRq.m
//  telechess-client
//
//  Created by Roman Lazarev on 15/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "RegisterDeviceRq.h"

@implementation RegisterDeviceRq
static NSString *const METHOD_URL = @"/registerDevice";

@synthesize uuid;
@synthesize nickname;

- (instancetype)initWithDeviceId:(NSString*)deviceId andNickname:(NSString*)nickname;
{
    self = [super init];
    if (self) {
        self.uuid = deviceId;
        self.nickname = nickname;
    }
    return self;
}

- (NSDictionary *)dictionary {
    return @{ @"uuid": [self uuid], @"nickname": [self nickname] };
}

+ (NSString *)methodUrl {
    return METHOD_URL;
}

@end
