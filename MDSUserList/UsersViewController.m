//
//  UsersViewController.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "UsersViewController.h"
#import "MDSUserManager.h"
#import "MDSUser.h"
#import "UserTableViewCell.h"
#import "MDSAppConstants.h"
#import "LoadingTableViewCell.h"
#import "AddUserViewController.h"

@interface UsersViewController () <UITableViewDelegate, UITableViewDataSource, MDSAddUserDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <MDSUser *> *users;
@property (nonatomic, assign) BOOL didFailToFetchUsers;

@end

@implementation UsersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.didFailToFetchUsers = FALSE;
    
    [self setupUI];

    [MDSUserManager getFirstPageOfUsersWithSuccess:^(NSMutableArray<MDSUser *> *fetchedUsers) {
        self.users = fetchedUsers;
        [self.tableView reloadData];
    } failure:^{
        self.didFailToFetchUsers = TRUE;
        [self.tableView reloadData];
    }];
}


# pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count ?: 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If network is slow to fetch users show loading text and spinner
    // If network request fails show failure text
    if(self.users.count == 0) {
        LoadingTableViewCell *loadingCell = [[LoadingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        [loadingCell setupWithFetchDidFail:self.didFailToFetchUsers];
        return loadingCell;
    }
    
    // Else display list of users
    UserTableViewCell *userCell = (UserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MDSUserTableViewCellIdentifier];
    if (!userCell) {
        userCell = (UserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MDSUserTableViewCellIdentifier];
    }
    
    MDSUser *user = [self.users objectAtIndex:indexPath.row];
    [userCell setupCellWithUser:user];
    return userCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
}


#pragma mark - UI Setup

- (void)setupUI
{
    self.navigationItem.title = @"Stack Overflow Users";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(plusButtonPressed)];
    [self setupTableView];
}

- (void)setupTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UserTableViewCell class] forCellReuseIdentifier:MDSUserTableViewCellIdentifier];
    UINib *nib = [UINib nibWithNibName:@"UserTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:MDSUserTableViewCellIdentifier];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = TRUE;
    [self.tableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = TRUE;
    [self.tableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = TRUE;
    [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = TRUE;
    [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = true;
}

- (void)viewDidLayoutSubviews
{
    self.tableView.frame = self.view.frame;
}

- (void)plusButtonPressed
{
    AddUserViewController *addUserViewController = [[AddUserViewController alloc] init];
    addUserViewController.delegate = self;
    [self.navigationController pushViewController:addUserViewController animated:TRUE];
}


#pragma mark - Add User Delegate

- (void)addUser:(MDSUser *)user
{
    [self.users insertObject:user atIndex:0];
    NSUInteger arrayIndex = [self.users indexOfObject:user];
    NSIndexPath *index = [NSIndexPath indexPathForRow:arrayIndex inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationMiddle];
}

@end



