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

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self.stateCode = [[dictionary valueForKey:@"stateCode"] unsignedIntegerValue];
    return self;
}

@end
