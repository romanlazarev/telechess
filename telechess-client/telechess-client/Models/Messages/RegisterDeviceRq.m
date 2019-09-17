//
//  RegisterDeviceRq.m
//  telechess-client
//
//  Created by Roman Lazarev on 15/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "RegisterDeviceRq.h"

NSString *const METHOD_URL = @"/registerDevice";

@implementation RegisterDeviceRq
@synthesize uuid;

- (NSDictionary *)dictionary {
    return @{ @"uuid": [self uuid] };
}

+ (NSString *)methodUrl {
    return METHOD_URL;
}

@end
