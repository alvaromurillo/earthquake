//
//  AppDelegate.m
//  Earthquake
//
//  Created by Marta López Martos on 17/06/13.
//  Copyright (c) 2013 Marta López Martos. All rights reserved.
//

#import "AppDelegate.h"
#import "UAirship.h"
#import "UAPush.h"
#import "Earthquake.h"
#import "EarthquakesMapViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	
	NSMutableDictionary *takeOffOptions = [NSMutableDictionary dictionary];
	[takeOffOptions setValue:launchOptions forKey:UAirshipTakeOffOptionsLaunchOptionsKey];
	[UAirship takeOff:takeOffOptions];
	
	// Register for notifications
	[[UAPush shared]
	 registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
										 UIRemoteNotificationTypeSound |
										 UIRemoteNotificationTypeAlert)];
	
	NSDictionary *notificationInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
	if (notificationInfo) {
		
		[self manageNotificationInfo:notificationInfo];
	}
	
    return YES;
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
	[UAirship land];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
		
	[[UAPush shared] registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {

	[self manageNotificationInfo:userInfo];
}

- (void)manageNotificationInfo:(NSDictionary *)notificationInfo {
	
	[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
	
	Earthquake *earthquake = [Earthquake earthquakeFromDictionary:notificationInfo];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
	EarthquakesMapViewController *earthquakesMapVC = (EarthquakesMapViewController *)[storyboard instantiateViewControllerWithIdentifier:@"EarthquakesMapViewController"];
	[earthquakesMapVC setSelectedEarthquake:earthquake];
	[earthquakesMapVC setOpenedFromPush:YES];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:earthquakesMapVC];
	[self.window.rootViewController presentModalViewController:navigationController animated:YES];
}


@end
