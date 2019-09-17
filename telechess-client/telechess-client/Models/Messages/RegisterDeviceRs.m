//
//  ReceivedMessage.m
//  telechess-client
//
//  Created by Roman Lazarev on 16/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "RegisterDeviceRs.h"

@implementation RegisterDeviceRs
@synthesize result;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self.result = [dictionary valueForKey:@"result"];
    return self;
}

@end
