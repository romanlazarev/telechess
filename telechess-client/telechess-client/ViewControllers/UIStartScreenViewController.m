//
//  UIStartScreenViewController.m
//  telechess-client
//
//  Created by Roman Lazarev on 12/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "UIStartScreenViewController.h"
#import "UIChessboardViewController.h"
#import "../Models/Messages/Messages.pch"
#import "../Models/Services/NetworkService.h"
#import "../Models/Services/GameService.h"

@interface UIStartScreenViewController ()

@end

@implementation UIStartScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    GameService *gameService = [GameService sharedInstance];
    
    if([gameService userTokenProvided] == NO || [gameService fetchUserState] == kUnknownToken) {
        [self showNicknameDialog:@selector(afterRegister)];
    } else {
        [self afterRegister];
    }
    
    /*NSString* userToken = [self registerDevice];
    [self fetchCurrentState:userToken];
    NSUInteger maxIterations = 4;
    NSUInteger i = 0;
    NSString *gameId = NULL;
    while (i <= maxIterations) {
        LookForGameRs *response = [self lookForGame:userToken];
        if (response.state == kGameStarted) {
            gameId = response.gameId;
            break;
        }
        [NSThread sleepForTimeInterval:1.0f];
        i++;
    }
    
    if(gameId) {
        GetGameStateRs *response = [self getGameState:gameId];
        NSLog(@"Game: %@", response);
    }*/
    
    
}

- (void)toggleGameAction:(id)sender {
    GameService *gs = [GameService sharedInstance];
    if(gs.isLookingForGame) {
        [gs stopLookForGame];
        [_toggleGame setTitle:@"Look for a game" forState:UIControlStateNormal];
        [self stopLoading];
    } else {
        [gs lookForGame:^(NSString *gameId) {
            [self performSegueWithIdentifier:@"to-chessboard" sender:self];
        }];
        [_toggleGame setTitle:@"Stop" forState:UIControlStateNormal];
        [self startLoading];
    }
    //
}

- (void)afterRegister {
    GameService *gameService = [GameService sharedInstance];
    if(gameService.lastUserState == kIdle) {
        [self stopLoading];
        [self showPlayerInfo];
    } else {
      [self performSegueWithIdentifier:@"to-chessboard" sender:self];
    }
}

- (void)showNicknameDialog:(SEL)okHandler {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Name" message:@"Input your nickname" preferredStyle:UIAlertControllerStyleAlert];
    if(!alert) {
        return;
    }
    NSString *nickname = [[GameService sharedInstance] playerName];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"name";
        //textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
        textField.text = nickname;
    }];
    UIAlertAction *okAction =
        [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            UITextField *nameField = alert.textFields.firstObject;
            if(nameField) {
                [[GameService sharedInstance] registerDevice:nameField.text];
            }
            
            IMP handlerImpl = [self methodForSelector:okHandler];
            if(handlerImpl) {
                void (*func)(id, SEL) = (void *)handlerImpl;
                func(self, okHandler);
            }
        }];
    okAction.enabled = (nickname != nil && nickname.length > 0);
    [alert addAction:okAction];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:alert.textFields.firstObject queue: [NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        
        UITextField *nameField = alert.textFields.firstObject;
        if(!nameField) {
            return;
        }
        
        okAction.enabled = nameField.text.length > 0;
    }];
    
    [self presentViewController:alert animated:NO completion:nil];
}

- (void)startLoading {
    if(_loadIndicator) {
        _loadIndicator.hidden = NO;
    }
    if(_loadingStateLabel) {
        _loadingStateLabel.hidden = NO;
    }
}

- (void)stopLoading {
    if(_loadIndicator) {
        _loadIndicator.hidden = YES;
    }
    if(_loadingStateLabel) {
        _loadingStateLabel.hidden = YES;
    }
}

- (void)showPlayerInfo {
    GameService *gs = [GameService sharedInstance];
    if(_playerNameLabel) {
        _playerNameLabel.text = gs.playerName;
        _victoriesLabel.text = [NSString stringWithFormat:@"%lu", gs.victories];
        _defeatsLabel.text = [NSString stringWithFormat:@"%lu", gs.defeats];
    }
    
    if(_playerView) {
        _playerView.hidden = NO;
        _toggleGame.hidden = NO;
    }
}

- (void)hidePlayerInfo {
    if(_playerView) {
        _playerView.hidden = YES;
        _toggleGame.hidden = YES;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
