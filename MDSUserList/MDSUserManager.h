//
//  MDSUserManager.h
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MDSUser;

@interface MDSUserManager : NSObject

+ (void)getFirstPageOfUsersWithSuccess:(void (^)(NSMutableArray <MDSUser *> *fetchedUsers))success failure:(void (^)(void))failure;

@end

