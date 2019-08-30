//
//  LoadingTableViewCell.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "LoadingTableViewCell.h"

@implementation LoadingTableViewCell

- (void)setupWithFetchDidFail:(BOOL)fetchDidFail
{
    NSString *cellText = @"Failed to fetch Stack Overflow Users";
  
    if(fetchDidFail == TRUE) {
        self.textLabel.textColor = [UIColor redColor];
        self.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cellText = @"Fetching Stack Overflow Users";
        self.textLabel.textColor = [UIColor blackColor];
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [spinner startAnimating];
        self.accessoryView = spinner;
    }
    
    self.textLabel.text = cellText;
}
@end
