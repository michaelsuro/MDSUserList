//
//  AddUserViewController.m
//  MDSUserList
//
//  Created by Projects on 8/29/19.
//  Copyright © 2019 Wildcatter. All rights reserved.
//

#import "AddUserViewController.h"
#import "MDSUser.h"

@interface AddUserViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextField *displayNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *reputationTextField;
@property (strong, nonatomic) IBOutlet UITextField *goldBadgeCountTextField;
@property (strong, nonatomic) IBOutlet UITextField *silverBadgeCountTextField;
@property (strong, nonatomic) IBOutlet UITextField *bronzeBadgeCountTextField;
@property (strong, nonatomic) IBOutlet UIButton *addUserButton;

@end

@implementation AddUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.displayNameTextField becomeFirstResponder];
}

- (void)setupUI
{
    self.navigationItem.title = @"Add User";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView.delegate = self;
    
    self.addUserButton.layer.cornerRadius = 5;
    self.addUserButton.layer.masksToBounds = TRUE;
    [self.addUserButton addTarget:self action:@selector(addUserButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:TRUE];
}

- (void)addUserButtonPressed
{
    if(self.displayNameTextField.text.length == 0) {
        [self showAlertController];
        return;
    }
    NSString *displayName = self.displayNameTextField.text;
    NSString *reputation = self.reputationTextField.text ?: @"0";
    NSString *gold = self.goldBadgeCountTextField.text ?: @"0";
    NSString *silver = self.silverBadgeCountTextField.text  ?: @"0";
    NSString *bronze = self.bronzeBadgeCountTextField.text ?: @"0";

    MDSUser *user = [[MDSUser alloc] initWithUsername:displayName reputationCount:reputation goldCount:gold silverCount:silver bronzeCount:bronze];
    [self.navigationController popViewControllerAnimated:TRUE];
    [self.delegate addUser:user];
}

- (void)showAlertController
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"You must enter a username" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
