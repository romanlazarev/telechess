//
//  LookForGameRs.m
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "LookForGameRs.h"

@implementation LookForGameRs
@synthesize gameId;
@synthesize state;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    gameId = [dictionary valueForKey:@"gameId"];
    state = [[dictionary valueForKey:@"state"] unsignedIntegerValue];
    return self;
}
@end
