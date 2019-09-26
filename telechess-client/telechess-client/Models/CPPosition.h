//
//  CPPosition.h
//  telechess-client
//
//  Created by Roman Lazarev on 26/09/2019.
//  Copyright © 2019 Roman Lazarev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef CPPosition_h
#define CPPosition_h

struct CPPosition {
    NSInteger row;
    NSInteger col;
};
typedef struct CG_BOXABLE CPPosition CPPosition;


#endif /* CPPosition_h */
