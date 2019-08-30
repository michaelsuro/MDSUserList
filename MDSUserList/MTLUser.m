//
//  MTLUser.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "MTLUser.h"

@implementation MTLUser

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"username"        : @"display_name",
             @"profileImageUrl" : @"profile_image",
             @"reputationCount" : @"reputation",
             @"badegCounts"     : @"badge_counts"
             };
}

@end
