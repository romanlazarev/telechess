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
@property NSString *gameId;
@property NSUInteger state;
@end

NS_ASSUME_NONNULL_END
