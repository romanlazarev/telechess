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
    kIdle = 0,              // Пользователь не в игре
    kInGame = 1,            // Пользователь в игре
    kUnknownToken = 100     // Токен не распознан (незарегистрированный пользователь)
};

// Коды состояния игры
typedef NS_ENUM(NSUInteger, GameStateCode) {
    kGameWaitingPlayers = 0, // Ожидание игроков
    kGameWaitingAccept = 5,  // Ожидание ответа от игроков
    kGameStarted = 10,       // Игра начата
    kGameFinished = 15       // Игра окончена
};

// Коды результата выхода из игры
typedef NS_ENUM(NSUInteger, ExitGameResultCode) {
    kWithoutPenalty = 0,    // Без штрафа за выход
    kWin = 1,               // Выход с победой (противник вышел раньше)
    kDefeat = 2             // Выход с поражением
};

// Коды типов фигур
typedef NS_ENUM(NSUInteger, CPType) {
    // 0 - empty
    kPawn = 1,                  // Пешка
    kRook = 2,                  // Ладья
    kKnight = 3,                // Конь
    kBishop = 4,                // Офицер
    kQueen = 5,                 // Ферзь
    kKing = 6                   // Король
};

//
typedef NS_ENUM(NSUInteger, CPSide) {
    kUndefinedSide = 0,
    kWhiteSide = 1,
    kBlackSide = 2
};

#endif /* Enums_h */
