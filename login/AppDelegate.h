//
//  AppDelegate.h
//  login
//
//  Created by Leoc O'Cear on 14-7-8.
//  Copyright (c) 2014年 Leoc O'Cear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
UIWindow *window;
UINavigationController *navigationController;
BMKMapManager* _mapManager;
}
@property (strong, nonatomic) UIWindow *window;
@end
