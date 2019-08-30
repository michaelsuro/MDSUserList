//
//  MDSAppAPI.h
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface MDSAppAPI : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *manager;

+ (MDSAppAPI *)sharedAPI;

- (void)performTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLResponse *response, id JSON, NSError *error))completionHandler;

@end

