//
//  MDSUser.h
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTLUser;

@interface MDSUser : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *reputationCount;
@property (nonatomic, strong) NSString *goldBadgeCount;
@property (nonatomic, strong) NSString *silverBadgeCount;
@property (nonatomic, strong) NSString *bronzeBadgeCount;

- (id)initWithMTLUser:(MTLUser *)user;
- (id)initWithUsername:(NSString *)username
       reputationCount:(NSString *)reputationCount
             goldCount:(NSString *)goldCount
           silverCount:(NSString *)silverCount
           bronzeCount:(NSString *)bronzeCount;

@end

