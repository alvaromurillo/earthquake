//
//  AppDelegate.h
//  Earthquake
//
//  Created by Marta López Martos on 17/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAPush.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UAPushNotificationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
