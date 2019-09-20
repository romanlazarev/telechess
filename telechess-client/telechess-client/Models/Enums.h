//
//  Enums.h
//  telechess-client
//
//  Created by Roman Lazarev on 19/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#ifndef Enums_h
#define Enums_h

// Коды состояние пользователя
typedef NS_ENUM(NSUInteger, UserStateCode) {
    kIdle = 0,
    kInGame = 1,
    kUnknownToken = 100
};

// Коды состояния игры
typedef NS_ENUM(NSUInteger, GameStateCode) {
    kGameWaitingPlayers = 0,
    kGameWaitingAccept = 5,
    kGameStarted = 10,
    kGameFinished = 15
};

//
typedef NS_ENUM(NSUInteger, CPType) {
    kPawn,
    kRook,
    kKnight,
    kBishop,
    kQueen,
    kKing
};

//
typedef NS_ENUM(NSUInteger, CPSide) {
    kWhite=1,
    kBlack=2
};

#endif /* Enums_h */
