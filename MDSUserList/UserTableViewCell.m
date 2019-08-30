//
//  UserTableViewCell.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "UserTableViewCell.h"
#import "MDSUser.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MDSAppConstants.h"

@implementation UserTableViewCell

- (void)setupCellWithUser:(MDSUser *)user
{
    self.nameLabel.text = user.username;
    self.reputationLabel.text = user.reputationCount;
    self.goldLabel.text = user.goldBadgeCount;
    self.silverLabel.text = user.silverBadgeCount;
    self.bronzeLabel.text = user.bronzeBadgeCount;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.gravatarImageView sd_setImageWithURL:[NSURL URLWithString:user.profileImageUrl] placeholderImage:[UIImage imageNamed:MDSPlaceholderImage]];
}


@end
