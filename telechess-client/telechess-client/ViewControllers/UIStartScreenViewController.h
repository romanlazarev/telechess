//
//  UIStartScreenViewController.h
//  telechess-client
//
//  Created by Roman Lazarev on 12/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIStartScreenViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *playerView;
@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *victoriesLabel;
@property (weak, nonatomic) IBOutlet UILabel *defeatsLabel;

@property (weak, nonatomic) IBOutlet UIButton *toggleGame;
- (IBAction)toggleGameAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadIndicator;
@property (weak, nonatomic) IBOutlet UILabel *loadingStateLabel;

@end

NS_ASSUME_NONNULL_END
