//
//  MDSUserManager.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "MDSUserManager.h"
#import "MDSRouter.h"
#import "MDSAppAPI.h"
#import "MDSNetworkConstants.h"
#import "MTLUser.h"
#import "MDSUser.h"

@implementation MDSUserManager

+ (void)getFirstPageOfUsersWithSuccess:(void (^)(NSMutableArray <MDSUser *> *fetchedUsers))success failure:(void (^)(void))failure;
{
    NSURLRequest *request = [MDSRouter getFirstPageOfUserData];
    [[MDSAppAPI sharedAPI] performTaskWithRequest:request completionHandler:^(NSURLResponse *response, id JSON, NSError *error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200){
            
            NSArray *responseArray = JSON[MDSGetUsersJSONResponse];
            NSLog(@"Response JSON : %@", responseArray);

            NSMutableArray <MDSUser *> *users = [[NSMutableArray alloc] init];
            
            if(responseArray.count > 0) {
                for(NSDictionary *dict in responseArray) {
                    MTLUser *mtlUser = [MTLJSONAdapter modelOfClass:[MTLUser class] fromJSONDictionary:dict error:&error];
                    MDSUser *mdsUser = [[MDSUser alloc] initWithMTLUser:mtlUser];
                    [users addObject:mdsUser];
                }
            }
            
            if(success) success(users);

        } else {
            NSLog(@"failed to fetch first page of stack overflow user data, error: %@", error.localizedDescription);
            if(failure) failure();
        }
    }];
}


@end
