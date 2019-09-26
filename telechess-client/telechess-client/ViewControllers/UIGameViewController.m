//
//  UIGameViewController.m
//  telechess-client
//
//  Created by Roman Lazarev on 24/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "UIGameViewController.h"
#import "GameService.h"

@interface UIGameViewController ()

@end

@implementation UIGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)exitGameAction:(id)sender {
    GameService *gs = [GameService sharedInstance];
    if(gs.isInGame) {
        [self openConfirmationDialog];
    } else {
        [self afterConfirm];
    }
}

- (void)openConfirmationDialog {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Exit the game"
                                   message:@"Do you want to exit?"
                                   preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        GameService *gs = [GameService sharedInstance];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [gs exitFromGame];
        });
        [self afterConfirm];
    }];

    [alert addAction:yesAction];
    [alert addAction:noAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)afterConfirm {
    [self.navigationController popViewControllerAnimated:true];
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
