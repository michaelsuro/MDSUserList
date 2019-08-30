//
//  LoadingTableViewCell.h
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingTableViewCell : UITableViewCell

- (void)setupWithFetchDidFail:(BOOL)fetchDidFail;

@end

