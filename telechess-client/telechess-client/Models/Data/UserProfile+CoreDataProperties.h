//
//  UserProfile+CoreDataProperties.h
//  telechess-client
//
//  Created by Roman Lazarev on 23/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//
//

#import "UserProfile+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserProfile (CoreDataProperties)

+ (NSFetchRequest<UserProfile *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *playerName;
@property (nullable, nonatomic, copy) NSString *userToken;

@end

NS_ASSUME_NONNULL_END
