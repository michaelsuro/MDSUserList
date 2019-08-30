//
//  MDSRouter.h
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDSRouter : NSObject

+ (void)setup;

#pragma mark - Get First Page of User Data

+ (NSURLRequest *)getFirstPageOfUserData;


@end


