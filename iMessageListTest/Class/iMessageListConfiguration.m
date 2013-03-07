//
//  iMessageListConfiguration.m
//  iMessageList
//
//  Created by Gloria Guo on 3/8/13.
//  Copyright (c) 2013 Gloria Guo. All rights reserved.
//

#import "iMessageListConfiguration.h"

static iMessageListConfiguration *sharedConfiguration = nil;

@implementation iMessageListConfiguration

@synthesize software;

+ (iMessageListConfiguration *)sharedConfiguration
{
    return sharedConfiguration;
}

+ (void) setSharedConfiguration:(iMessageListConfiguration *)configuration {
    if (configuration != sharedConfiguration) {
        //sharedConfiguration = [configuration retain];
    }
}

- (id)initWithUserDefaults:(NSUserDefaults *)userDefaults
{
    self = [super init];
    if (self) {
        self.software = [[iMessageListConfigurationSoftware alloc] init];
        self.software.used = [NSMutableDictionary dictionaryWithDictionary:[userDefaults valueForKeyPath:@"software.used"]];
        self.software.version = [userDefaults valueForKeyPath:@"software.version"];
        self.software.notify = [[userDefaults valueForKeyPath:@"software.notify"] boolValue];
        self.software.rated = [[userDefaults valueForKeyPath:@"software.rated"] boolValue];
        
        if (sharedConfiguration == nil) {
            [iMessageListConfiguration setSharedConfiguration:self];
        }
    }
    
    return self;
}

- (void)save
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:[NSDictionary dictionaryWithObjectsAndKeys:
                            self.software.used, @"used",
                            self.software.version, @"version", 
                            [NSNumber numberWithBool:self.software.notify], @"notify",
                            [NSNumber numberWithBool:self.software.rated], @"rated",
                            nil] forKey:@"software"];
    
    
    [userDefault synchronize];
}
@end

@implementation iMessageListConfigurationSoftware
@synthesize version, used, notify, rated;
@end
