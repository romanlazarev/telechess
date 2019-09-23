//
//  LookForGameRq.h
//  telechess-client
//
//  Created by Roman Lazarev on 18/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface LookForGameRq : Message
@property (nonatomic, copy) NSString *userToken;

- (instancetype)initWithUserToken:(NSString*)token;
@end

NS_ASSUME_NONNULL_END
