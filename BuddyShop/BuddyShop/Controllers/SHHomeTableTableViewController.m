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
#import "SHVerticalCollectionViewController.h"
#import "SHHorizontalCollectionViewController.h"

@interface SHHomeTableTableViewController ()
@property (weak, nonatomic) IBOutlet UIView *horizontalContainerView;

@property (weak, nonatomic) IBOutlet UIView *verticalContainerView;

@property (weak, nonatomic,readonly) SHHorizontalCollectionViewController *flashVC;
@property (weak, nonatomic,readonly) SHVerticalCollectionViewController *productsVC;

@property (strong, nonatomic) SHResponse *flashResponse;
@property (strong, nonatomic) SHResponse *homeResponse;

@end

@implementation SHHomeTableTableViewController

- (SHHorizontalCollectionViewController *)flashVC {
    return (SHHorizontalCollectionViewController *)self.childViewControllers.firstObject;
}

- (SHVerticalCollectionViewController *)productsVC {
    return (SHVerticalCollectionViewController *)self.childViewControllers.lastObject;
}

- (void)setFlashResponse:(SHResponse *)flashResponse {
    _flashResponse = flashResponse;
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.flashVC setFlashResponse:flashResponse];
}

- (void) setHomeResponse:(SHResponse *)homeResponse {
    _homeResponse = homeResponse;
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.productsVC setHomeResponse:homeResponse];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SHResponseMapper configure];
    
    __weak SHHomeTableTableViewController *weakSelf = self;
    
    [[SHServiceManager sharedManager] getWithPath:@"api/flash/" parameters:nil returnType:[SHResponse class] completionBlock:^(SHResponse *result, NSError *error) {
        NSLog(@"Flash ------>>>>%@\n\n", [result.output.data.items valueForKey:@"name"]);
        [weakSelf setFlashResponse:result];
    }];
    
    [[SHServiceManager sharedManager] getWithPath:@"api/home/" parameters:@{@"PAGED": @(0)} returnType:[SHResponse class] completionBlock:^(SHResponse *result, NSError *error) {
        NSLog(@"Product ------>>>>%@", [result.output.data.items valueForKey:@"name"]);
        [weakSelf setHomeResponse:result];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] > 0)  {
        unsigned long numRows = _homeResponse.output.data.items.count/2;
        return (CGFloat)numRows * 280.0;
    }
    return 300.0;
}
@end
