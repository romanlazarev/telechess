//
//  NetworkGameModel.h
//  telechess-client
//
//  Created by Roman Lazarev on 10/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Messages/Message.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (id)sharedInstance;

- (void)request:(Message*)message;
- (nullable Message*)request:(Message*)message withResponseClass:(Class)aClass;

// регистрация устройства, получение токена
//- (void)registerDevice:(NSString*)deviceUUID;

// вход по токену

// запрос состояния
//-(void)getActiveGame;

// регистрация на игру (looking for a game)
//-(void)askForGame;

// получение состояния игры

// отправка состояния игры
//-(void)submitGameState;

// выйти из игры (завершить/сдаться)
//-(void)quitGame;

// получить статистику по играм
//-()

@end

NS_ASSUME_NONNULL_END
