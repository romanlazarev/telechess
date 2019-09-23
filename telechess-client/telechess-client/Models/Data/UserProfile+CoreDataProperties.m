//
//  UserProfile+CoreDataProperties.m
//  telechess-client
//
//  Created by Roman Lazarev on 23/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//
//

#import "UserProfile+CoreDataProperties.h"

@implementation UserProfile (CoreDataProperties)

+ (NSFetchRequest<UserProfile *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"UserProfile"];
}

@dynamic playerName;
@dynamic userToken;

@end
