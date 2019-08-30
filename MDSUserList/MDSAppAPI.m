//
//  MDSAppAPI.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "MDSAppAPI.h"

static MDSAppAPI *_sharedInstance = nil;

@implementation MDSAppAPI

+ (MDSAppAPI *)sharedAPI
{
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[MDSAppAPI alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeManager];
    }
    return self;
}

- (void)initializeManager
{
    self.manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    self.manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
}

- (void)performTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSURLResponse *response, id JSON, NSError *error))completionHandler
{
    NSURLSessionDataTask *dataTask = [self JSONDataTaskWithRequest:request completionHandler:completionHandler];
    [dataTask resume];
}

- (NSURLSessionDataTask *)JSONDataTaskWithRequest:(NSURLRequest *)urlRequest completionHandler:(void (^)(NSURLResponse *response, id JSON, NSError *error))completionHandler
{
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:urlRequest uploadProgress:nil downloadProgress:nil completionHandler:completionHandler];
    return dataTask;
}

@end
