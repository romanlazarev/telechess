//
//  AppConstants.m
//  telechess-client
//
//  Created by Roman Lazarev on 25/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "Foundation/Foundation.h"

NSString* const LOOK_FOR_GAME_TITLE = @"Look for a game";
NSString* const STOP_LOOKING_FOR_GAME_TITLE = @"Stop";

NSNotificationName const ActiveGameDidUpdatedNotification = @"ChessGameActiveGameDidUpdatedNotification";

NSString* const SERVICE_HOST_URL = @"https://us-central1-chess-game-48719.cloudfunctions.net";
NSUInteger const URL_REQUEST_TIMEOUT = 15;

double const LOOK_FOR_GAME_INTERVAL_SEC = 1.0f;
double const GET_REMOTE_GAME_STATE_INTERVAL_SEC = 5.0f;
