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

@interface SHHomeTableTableViewController () {
    __block BOOL isLoading;
    __block NSUInteger totalItems;
}
@property (weak, nonatomic) IBOutlet UIView *horizontalContainerView;

@property (weak, nonatomic) IBOutlet UIView *verticalContainerView;

@property (strong, nonatomic,readonly) SHHorizontalCollectionViewController *flashVC;
@property (strong, nonatomic,readonly) SHVerticalCollectionViewController *productsVC;

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
    
    [self.tableView reloadData];
    [self.flashVC setFlashResponse:flashResponse];
}

- (void) setHomeResponse:(SHResponse *)homeResponse {
    _homeResponse = homeResponse;
    [self.tableView reloadData];
    [self.productsVC setHomeResponse:homeResponse];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SHResponseMapper configure];
    
    isLoading = YES;
    totalItems = 0;
    
    __weak SHHomeTableTableViewController *weakSelf = self;
    
    [[SHServiceManager sharedManager] getWithPath:@"api/flash/" parameters:nil returnType:[SHResponse class] completionBlock:^(SHResponse *result, NSError *error) {
        NSLog(@"Flash ------>>>>%@\n\n", [result.output.data.items valueForKey:@"name"]);
        
        [weakSelf setFlashResponse:result];
    }];
    
    [self loadHomeProductsWithPageNumber:@(0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] > 0)  {
        unsigned long numRows = totalItems/2;
        return (CGFloat)numRows * 280.0;
    }
    return 300.0;
}

- (void)loadHomeProductsWithPageNumber:(NSNumber *)pageNo {
    __weak SHHomeTableTableViewController *weakSelf = self;
    [[SHServiceManager sharedManager] getWithPath:@"api/home/" parameters:@{@"PAGED": pageNo} returnType:[SHResponse class] completionBlock:^(SHResponse *result, NSError *error) {
        NSLog(@"Product ------>>>>%@", [result.output.data.items valueForKey:@"name"]);
        self->isLoading = NO;
        self->totalItems += result.output.data.items.count;
        [weakSelf setHomeResponse:result];
    }];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat scrollViewContenteHeight = scrollView.contentSize.height;
    CGFloat currentOffset = scrollView.contentOffset.y;
    int endOfPage = (int)(currentOffset + scrollView.frame.size.height) >=  (int)(scrollViewContenteHeight);
    if (_homeResponse != nil && endOfPage && !isLoading){
        isLoading = YES;
        [self.tableView reloadData];
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:NO];

        SHOutputNavigation *navigation = _homeResponse.output.navigation;
        if ([navigation.page intValue] < [navigation.maxPage intValue]) {
            
            [self loadHomeProductsWithPageNumber:@([navigation.page intValue]+1)];
        }
    }
    
}


@end
