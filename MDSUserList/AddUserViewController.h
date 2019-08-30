//
//  AddUserViewController.h
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDSUser;

@protocol MDSAddUserDelegate <NSObject>

@required

- (void)addUser:(MDSUser *)user;

@end

@interface AddUserViewController : UIViewController

@property (nonatomic) id <MDSAddUserDelegate> delegate;

@end

