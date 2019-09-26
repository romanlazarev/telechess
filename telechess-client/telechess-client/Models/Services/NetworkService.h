//
//  NetworkService.h
//  telechess-client
//
//  Created by Roman Lazarev on 10/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Messages/Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

+ (instancetype)sharedInstance;

- (void)request:(Message*)message;
- (nullable Message*)request:(Message*)message withResponseClass:(Class)aClass;

@end

NS_ASSUME_NONNULL_END
