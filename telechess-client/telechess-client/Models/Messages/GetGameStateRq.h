//
//  GetGameStateRq.h
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetGameStateRq : Message
@property (nonatomic, copy) NSString *userToken;
@property (nonatomic, copy) NSString *gameId;

- (instancetype)initWithUserToken:(NSString*)token andGameId:(NSString *)game;
@end

NS_ASSUME_NONNULL_END
