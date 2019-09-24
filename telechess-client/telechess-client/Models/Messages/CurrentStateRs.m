//
//  CurrentStateRs.m
//  telechess-client
//
//  Created by Roman Lazarev on 18/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "CurrentStateRs.h"

@implementation CurrentStateRs
@synthesize stateCode;
@synthesize victories;
@synthesize defeats;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    stateCode = [[dictionary valueForKey:@"stateCode"] unsignedIntegerValue];
    victories = [[dictionary valueForKey:@"victories"] unsignedIntegerValue];
    defeats = [[dictionary valueForKey:@"defeats"] unsignedIntegerValue];
    return self;
}

@end
