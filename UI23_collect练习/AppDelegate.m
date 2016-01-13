//
//  AppDelegate.m
//  UI23_collect练习
//
//  Created by dllo on 16/1/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@property (nonatomic, retain)UITabBarController *tbc;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self createTabBarController];
    
    return YES;
}

- (void)createTabBarController{
    self.tbc = [[UITabBarController alloc] init];
    
    ViewController *item1 = [[ViewController alloc]init];
    UINavigationController *first = [[UINavigationController alloc] initWithRootViewController:item1];
    first.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"list" image:[UIImage imageNamed:@"m"] tag:100];
    item1.navigationItem.title = @"豆瓣电影列表";
    
    SecondViewController *item2 = [[SecondViewController alloc]init];
    UINavigationController *second = [[UINavigationController alloc] initWithRootViewController:item2];
     second.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"user" image:[UIImage imageNamed:@"user"] tag:200];
    
    self.tbc.viewControllers = @[first, second];
    
    self.window.rootViewController = _tbc;
}








- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
