//
//  UIChessPiece.m
//  telechess-client
//
//  Created by Roman Lazarev on 12/08/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import "UIChessPiece.h"

@implementation UIChessPiece

-(id)initWithImage:(UIImage*)anImage andRect:(CGRect)rect
{
    self = [super initWithFrame:rect];
    if (self != nil) {
        self.image = anImage;
    }
    
    self.backgroundColor = [UIColor clearColor];
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self.image drawInRect:rect];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesEnded");
}

- (void)tapped:(UIChessPiece *)sender {
}

@end
