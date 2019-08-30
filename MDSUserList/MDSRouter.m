//
//  MDSRouter.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "MDSRouter.h"
#import <AFNetworking/AFNetworking.h>
#import "MDSNetworkConstants.h"

static AFHTTPSessionManager *staticHTTPClient = nil;

@implementation MDSRouter


#pragma mark - Router Setup

+ (void)setup
{
    NSURL *baseUrl = [NSURL URLWithString:MDSBaseApiUrl];
    staticHTTPClient = [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
    staticHTTPClient.requestSerializer = [AFJSONRequestSerializer serializer];
    [staticHTTPClient.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}

+ (NSMutableURLRequest *)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)params
{
    NSString *fullPath = [[staticHTTPClient.baseURL URLByAppendingPathComponent:path] absoluteString];
    return [self requestWithMethod:method URLString:fullPath parameters:params];
}

+ (NSMutableURLRequest *)requestWithMethod:(NSString *)method URLString:(NSString *)urlString parameters:(NSDictionary *)params
{
    NSMutableURLRequest *request = [staticHTTPClient.requestSerializer requestWithMethod:method URLString:urlString parameters:params error:nil];
    return request;
}


#pragma mark - NSURLRequest Builders


#pragma mark - User Data

+ (NSURLRequest *)getFirstPageOfUserData
{
    NSDictionary *params = @{ @"page" : @1, @"site" : @"stackoverflow" };

    return [self requestWithMethod:@"GET" path:MDSGetUsersUrl parameters:params];
}

@end
