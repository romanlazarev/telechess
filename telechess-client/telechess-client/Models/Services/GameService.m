//
//  GameService.m
//  telechess-client
//
//  Created by Roman Lazarev on 20/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <sys/utsname.h>
#import <UIKit/UIKit.h>
#import "GameService.h"
#import "NetworkService.h"
#import "../Messages/Messages.pch"

@implementation GameService {
    NSString *userToken;
    NSString *activeGameId;
}
+ (instancetype)sharedInstance {
    static GameService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

@synthesize playerName;
@synthesize lastUserState;
@synthesize playerRegistered;
@synthesize isInGame;
@synthesize isLookingForGame;
@synthesize activeGame;
@synthesize victories;
@synthesize defeats;

@synthesize persistentContainer = _persistentContainer;

- (void)registerDevice:(NSString*)nickname {
    UIDevice *device = [UIDevice currentDevice];
    NSString *uuid = [[device identifierForVendor] UUIDString];
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *model = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    RegisterDeviceRq *registerRq = [[RegisterDeviceRq alloc] initWithDeviceId:uuid andNickname:nickname andDeviceModel:model];
    
    RegisterDeviceRs *response = (RegisterDeviceRs*)[[NetworkService sharedInstance] request:registerRq withResponseClass:[RegisterDeviceRs class]];
    
    playerRegistered = response.userToken != nil && response.userToken.length > 0;
    userToken = response.userToken;
    playerName = nickname;
    NSLog(@"Register device:\nnickname: %@\nuuid: %@\nmodel: %@\nuserToken: %@", nickname, uuid, model, userToken);
    [self saveUserProfile];
}

- (UserStateCode)fetchUserState {
    if([self userTokenProvided] == NO)
        return kUnknownToken;
    
    CurrentStateRq *messageRq = [[CurrentStateRq alloc] initWithUserToken:userToken];
    CurrentStateRs *response = (CurrentStateRs*)[[NetworkService sharedInstance] request:messageRq withResponseClass:[CurrentStateRs class]];
    victories = response.victories;
    defeats = response.defeats;
    
    lastUserState = response.stateCode;
    isInGame = lastUserState == kInGame; // TODO remove this
    return response.stateCode;
}

- (void)lookForGame:(void (^)(NSString *gameId))complete {
    if([self userTokenProvided] == NO || isLookingForGame)
        return;
    
    isLookingForGame = YES;
    
    LookForGameRq *messageRq = [[LookForGameRq alloc] initWithUserToken:userToken];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSInteger try = 1;
        while (self.isLookingForGame) {
            LookForGameRs *response = (LookForGameRs*)[[NetworkService sharedInstance] request:messageRq withResponseClass:[LookForGameRs class]];
            NSLog(@"Try number: %ld", try);
            if(response.state == kGameStarted) {
                self->activeGameId = response.gameId;
                break;
            }
            
            [NSThread sleepForTimeInterval:1.0f];
            try++;
        }

        self->isLookingForGame = NO;
        self->isInGame = YES;
        
        if(!complete || self->activeGameId == nil || self->activeGameId.length == 0)
            return;
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            complete(self->activeGameId);
        });
    });
}

- (void)stopLookForGame {
    isLookingForGame = NO;
}

- (void)exitFromGame {
    if([self userTokenProvided] == NO || isInGame == NO /*|| activeGameId || activeGameId.length == 0*/ )
        return;
    
    ExitGameRq *messageRq = [[ExitGameRq alloc] initWithUserToken:userToken andGameId:activeGameId];
    ExitGameRs *response = (ExitGameRs*)[[NetworkService sharedInstance] request:messageRq withResponseClass:[ExitGameRs class]];
}

- (BOOL)userTokenProvided {
    return (userToken != NULL && userToken.length >= 0);
}

- (void)loadUserProfile {
    NSManagedObjectContext *context = [[self persistentContainer] viewContext];
    
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:[UserProfile fetchRequest] error:&error];
    if (error == nil) {
        UserProfile *profile = [results firstObject];
        if(profile) {
            playerName = profile.playerName;
            userToken = profile.userToken;
        } else {
            NSLog(@"User not found");
        }
    }
}

- (void)saveUserProfile {
    NSManagedObjectContext *context = [[self persistentContainer] viewContext];
    
    UserProfile *profile = nil;
    NSError *error = nil;
    NSArray *results = [context executeFetchRequest:[UserProfile fetchRequest] error:&error];
    if (error == nil) {
        profile = [results firstObject];
    }
    
    if(profile == nil) {
        profile = [[UserProfile alloc] initWithContext:context];
    }
    
    profile.playerName = playerName;
    profile.userToken = userToken;
    
    [context save:&error];
    if(error) {
        NSLog(@"Error occured while saving Core Data context:\n%@", error);
    }
}

/*- (LookForGameRs*)lookForGame:(NSString*)userToken {
 
    NSLog(@"Game state code: %lu", response.state);
    return response;
}*/

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"telechess_client"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

@end
