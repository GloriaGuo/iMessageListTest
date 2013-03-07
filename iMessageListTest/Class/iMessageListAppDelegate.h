//
//  iMessageListAppDelegate.h
//  iMessageListTest
//
//  Created by Gloria Guo on 3/5/13.
//  Copyright (c) 2013 Gloria Guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BlocksKit/BlocksKit.h>

@interface iMessageListAppDelegate : NSObject
<UIApplicationDelegate, UITabBarControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (nonatomic, retain) NSDate *modalDate;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
