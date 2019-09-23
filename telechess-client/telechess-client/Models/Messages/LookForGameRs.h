//
//  LookForGameRs.h
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface LookForGameRs : Message
@property (nonatomic, copy, readonly) NSString *gameId;
@property (nonatomic, readonly) NSUInteger state;
@end

NS_ASSUME_NONNULL_END
