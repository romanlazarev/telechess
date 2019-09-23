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
@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *model;

- (instancetype)initWithDeviceId:(NSString*)deviceId andNickname:(NSString*)nickname andDeviceModel:(NSString*)deviceModel;

@end

NS_ASSUME_NONNULL_END
