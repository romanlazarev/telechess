//
//  RegisterDeviceRq.h
//  telechess-client
//
//  Created by Roman Lazarev on 15/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterDeviceRq : Message
@property NSString *uuid;
@property NSString *nickname;

- (instancetype)initWithDeviceId:(NSString*)deviceId andNickname:(NSString*)nickname;

@end

NS_ASSUME_NONNULL_END
