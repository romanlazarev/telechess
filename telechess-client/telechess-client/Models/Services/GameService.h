//
//  GameService.h
//  telechess-client
//
//  Created by Roman Lazarev on 20/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>
#import "UserProfile+CoreDataClass.h"
#import "UserProfile+CoreDataProperties.h"
#import "Game.h"
#import "Enums.h"

@interface GameService : NSObject
+ (instancetype)sharedInstance;

@property (nonatomic, copy, readonly) NSString *playerName;
@property (nonatomic, readonly) UserStateCode lastUserState;
@property (nonatomic, readonly) NSUInteger victories;
@property (nonatomic, readonly) NSUInteger defeats;
@property (nonatomic, readonly) BOOL playerRegistered;
@property (atomic, readonly) BOOL isInGame;
@property (atomic, readonly) BOOL isLookingForGame;
@property (readonly) Game *activeGame;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)loadUserProfile;
- (void)saveUserProfile;
    
- (BOOL)userTokenProvided;

- (void)registerDevice:(NSString*)nickname;
- (UserStateCode)fetchUserState;

- (void)lookForGame:(void (^)(NSString *gameId))complete;
- (void)stopLookForGame;
- (void)exitFromGame;

- (void)updateGameState;

@end
