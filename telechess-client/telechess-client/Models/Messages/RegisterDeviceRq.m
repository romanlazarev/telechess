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
@synthesize model;

- (instancetype)initWithDeviceId:(NSString*)deviceId andNickname:(NSString*)aNickname andDeviceModel:(nonnull NSString *)deviceModel;
{
    self = [super init];
    if (self) {
        uuid = deviceId;
        nickname = aNickname;
        model = deviceModel;
    }
    return self;
}

- (NSDictionary *)dictionary {
    return @{ @"uuid": [self uuid], @"nickname": [self nickname], @"model": [self model] };
}

+ (NSString *)methodUrl {
    return METHOD_URL;
}

@end
