//
//  CurrentStateRs.h
//  telechess-client
//
//  Created by Roman Lazarev on 18/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Message.h"
#import "Enums.h"


NS_ASSUME_NONNULL_BEGIN

@interface CurrentStateRs : Message
@property (nonatomic, readonly) NSUInteger stateCode;
@end

NS_ASSUME_NONNULL_END
