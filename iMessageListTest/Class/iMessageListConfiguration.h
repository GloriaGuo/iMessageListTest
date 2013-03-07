//
//  iMessageListConfiguration.h
//  iMessageList
//
//  Created by Gloria Guo on 3/8/13.
//  Copyright (c) 2013 Gloria Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class iMessageListConfigurationSoftware;

@interface iMessageListConfiguration : NSObject {
}

@property (nonatomic, strong) iMessageListConfigurationSoftware *software;

+ (iMessageListConfiguration *)sharedConfiguration;
+ (void)setSharedConfiguration:(iMessageListConfiguration *)configuration;
- (id)initWithUserDefaults:(NSUserDefaults *)userDefaults;
- (void)save;
@end

@interface iMessageListConfigurationSoftware : NSObject {
}

@property (nonatomic) NSMutableDictionary *used;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, assign, getter=isNotify) BOOL notify;
@property (nonatomic, assign, getter=isRated) BOOL rated;
@end
