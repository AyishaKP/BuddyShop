//
//  SHHomeTableTableViewController.m
//  BuddyShop
//
//  Created by Ayisha on 16/07/18.
//  Copyright © 2018 Awok. All rights reserved.
//

#import "SHHomeTableTableViewController.h"
#import "SHServiceManager.h"
#import "SHResponseMapper.h"
#import "SHResponse.h"


@interface SHHomeTableTableViewController ()
@property (weak, nonatomic) IBOutlet UIView *horizontalContainerView;

@property (weak, nonatomic) IBOutlet UIView *verticalContainerView;
@end

@implementation SHHomeTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SHResponseMapper configure];
    
    [[SHServiceManager sharedManager] getWithPath:@"api/flash/" parameters:nil returnType:[SHResponse class] completionBlock:^(SHResponse *result, NSError *error) {
        NSLog(@"Flash ------>>>>%@\n\n", [result.output.data.items valueForKey:@"name"]);
    }];
    
    [[SHServiceManager sharedManager] getWithPath:@"api/home/" parameters:@{@"PAGED": @(0)} returnType:[SHResponse class] completionBlock:^(SHResponse *result, NSError *error) {
        NSLog(@"Product ------>>>>%@", [result.output.data.items valueForKey:@"name"]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
