//
//  NetworkGameModel.m
//  telechess-client
//
//  Created by Roman Lazarev on 10/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+(id)sharedInstance {
    static NetworkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

@end
