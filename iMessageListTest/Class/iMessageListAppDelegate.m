//
//  iMessageListAppDelegate.m
//  iMessageListTest
//
//  Created by Gloria Guo on 3/5/13.
//  Copyright (c) 2013 Gloria Guo. All rights reserved.
//

#import <BlocksKit/BlocksKit.h>
#import "iMessageListAppDelegate.h"
#import "iMessageListConfiguration.h"

@implementation iMessageListAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize modalDate;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[self createEditableCopyOfDatabaseIfNeeded];
    // Override point for customization after application launch.
    NSString *plist = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"iMessageList-Default.plist"];
    NSDictionary *defaults = [NSDictionary dictionaryWithContentsOfFile:plist];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults registerDefaults:defaults];
    
    NSString *version = [defaults valueForKeyPath:@"software.version"];
    NSLog(@"version becomes %@",version);
    
    iMessageListConfiguration *configuration = [[iMessageListConfiguration alloc] initWithUserDefaults:userDefaults];
    NSUInteger used = [[configuration.software.used objectForKey:configuration.software.version] intValue];
    NSLog(@"iMessageList version %@ has been opened %d times",configuration.software.version, used+1);
    if (version != configuration.software.version) { //upgraded
        configuration.software.version = version;
    }
    
    [configuration.software.used setObject:[NSNumber numberWithInteger:used+1] forKey:configuration.software.version];
    [configuration save];
    
    /*[MagicalRecordHelpers setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"iMessageList.sqlite"];
    [RKManagedObjectStore setDefaultObjectStore:[RKManagedObjectStore objectStoreWithStoreFilename:@"iMessageList.sqlite"]];*/
    //[self initDb];
    
    application.statusBarStyle = UIStatusBarStyleBlackOpaque;
    
    [self.window makeKeyAndVisible];
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    /*NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }*/
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
