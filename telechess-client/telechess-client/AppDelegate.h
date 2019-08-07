//
//  AppDelegate.h
//  telechess-client
//
//  Created by Roman Lazarev on 07/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

