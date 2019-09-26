//
//  Constants.h
//  telechess-client
//
//  Created by Roman Lazarev on 25/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h

extern NSString* const LOOK_FOR_GAME_TITLE;
extern NSString* const STOP_LOOKING_FOR_GAME_TITLE;

extern NSNotificationName const ActiveGameDidUpdatedNotification;

extern NSString* const SERVICE_HOST_URL;
extern NSUInteger const URL_REQUEST_TIMEOUT;

extern double const LOOK_FOR_GAME_INTERVAL_SEC;
extern double const GET_REMOTE_GAME_STATE_INTERVAL_SEC;

#endif /* AppConstants_h */
