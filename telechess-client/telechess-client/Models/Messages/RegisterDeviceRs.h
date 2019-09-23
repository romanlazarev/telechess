//
//  RegisterDeviceRs.h
//  telechess-client
//
//  Created by Roman Lazarev on 16/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisterDeviceRs : Message
@property (nonatomic, copy, readonly) NSString *userToken;

@end

NS_ASSUME_NONNULL_END
