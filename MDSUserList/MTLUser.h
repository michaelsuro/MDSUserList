//
//  MTLUser.h
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MTLUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *profileImageUrl;
@property (nonatomic, copy, readonly) NSNumber *reputationCount;
@property (nonatomic, copy, readonly) NSDictionary *badegCounts;

@end

