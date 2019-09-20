//
//  CurrentStateRq.h
//  telechess-client
//
//  Created by Roman Lazarev on 18/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface CurrentStateRq : Message
@property NSString* userToken;

- (instancetype)initWithUserToken:(NSString*)userToken;
@end

NS_ASSUME_NONNULL_END
