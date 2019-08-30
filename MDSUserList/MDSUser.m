//
//  MDSUser.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "MDSUser.h"
#import "MTLUser.h"

@implementation MDSUser

- (id)initWithMTLUser:(MTLUser *)user
{
    self = [super init];
    if(self) {
        
        _username = user.username;
        _profileImageUrl = user.profileImageUrl;
        _goldBadgeCount = [user.badegCounts[@"gold"] stringValue];
        _silverBadgeCount = [user.badegCounts[@"silver"] stringValue];
        _bronzeBadgeCount = [user.badegCounts[@"bronze"] stringValue];
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        _reputationCount = [numberFormatter stringFromNumber:user.reputationCount];
    }
    return self;
}

- (id)initWithUsername:(NSString *)username
       reputationCount:(NSString *)reputationCount
             goldCount:(NSString *)goldCount
           silverCount:(NSString *)silverCount
           bronzeCount:(NSString *)bronzeCount
{
    self = [super init];
    if(self) {
        
        _username = username;
        _goldBadgeCount = goldCount;
        _silverBadgeCount = silverCount;
        _bronzeBadgeCount = bronzeCount;
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        _reputationCount = [numberFormatter stringFromNumber:[NSNumber numberWithInteger:[reputationCount integerValue]]];
    }
    return self;
}

@end
