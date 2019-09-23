//
//  ReceivedMessage.m
//  telechess-client
//
//  Created by Roman Lazarev on 16/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "RegisterDeviceRs.h"

@implementation RegisterDeviceRs
@synthesize userToken;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    userToken = [dictionary valueForKey:@"userToken"];
    return self;
}

@end
