//
//  SHHomeTableTableViewController.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHHomeTableTableViewController.h"
#import "SHServiceManager.h"
#import "SHFlashResponse.h"

@interface SHHomeTableTableViewController ()
@property (weak, nonatomic) IBOutlet UIView *horizontalContainerView;

@property (weak, nonatomic) IBOutlet UIView *verticalContainerView;
@end

@implementation SHHomeTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[SHServiceManager sharedManager] getWithPath:@"api/flash/" parameters:nil returnType:[SHFlashResponse class] completionBlock:^(id result, NSError *error) {
        NSLog(result);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
