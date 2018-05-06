//
//  AppDelegate.m
//  hlthhack
//
//  Created by Doug Suriano on 5/5/18.
//  Copyright © 2018 wiestyfbaby. All rights reserved.
//

#import "AppDelegate.h"
#import "hlthhack-Swift.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor hltnLightBlue]];
    [[UINavigationBar appearance] setTintColor:[UIColor hltnDarkBlue]];
    [[UINavigationBar appearance] setLargeTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor hltnDarkBlue]}];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor hltnDarkBlue]}];
    [[UITabBar appearance] setBarTintColor:[UIColor hltnLightBlue]];
    [[UITabBar appearance] setTintColor:[UIColor hltnDarkBlue]];

    
    RootViewController *vc = [[RootViewController alloc] initWithNibName:nil bundle:nil];
    
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];

    
    return YES;
}



@end
