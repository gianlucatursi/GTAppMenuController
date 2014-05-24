//
//  GTAppDelegate.m
//  GTAppMenuController
//
//  Created by Gianluca Tursi on 23/05/14.
//  Copyright (c) 2014 Gianluca Tursi. All rights reserved.
//

#import "GTAppDelegate.h"
#import "GTFrontViewController.h"
#import "GTBackViewController.h"
#import "GTAppMenuController.h"

@implementation GTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    UIStoryboard *str = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GTBackViewController *_back = [str instantiateViewControllerWithIdentifier:@"back"];

    self.backWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.backWindow.rootViewController = _back;
    [self.backWindow makeKeyAndVisible];

    GTAppMenuController *_front = [str instantiateViewControllerWithIdentifier:@"front"];
    self.frontWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.frontWindow.rootViewController = _front;
    self.frontWindow.windowLevel = UIWindowLevelStatusBar;
    [self.frontWindow makeKeyAndVisible];
 
    return YES;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
