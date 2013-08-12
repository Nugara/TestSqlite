//
//  AppDelegate.h
//  TestSqlite
//
//  Created by giuseppen on 8/12/13.
//  Copyright (c) 2013 giuseppen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) FirstViewController *firstViewController;

@end
