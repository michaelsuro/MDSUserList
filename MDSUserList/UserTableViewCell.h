//
//  UserTableViewCell.h
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDSUser;

@interface UserTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *gravatarImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *reputationLabel;
@property (strong, nonatomic) IBOutlet UILabel *goldLabel;
@property (strong, nonatomic) IBOutlet UILabel *silverLabel;
@property (strong, nonatomic) IBOutlet UILabel *bronzeLabel;

- (void)setupCellWithUser:(MDSUser *)user;

@end
