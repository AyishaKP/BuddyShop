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
#import "SHLoadMoreCell.h"

typedef NS_ENUM(NSUInteger, ViewType) {
    ViewTypeHorizontalCollection,
    ViewTypeVerticalCollection,
    ViewTypeLoadingCell
};

@interface SHHomeTableTableViewController () {
    __block BOOL isLoading;
    __block NSUInteger totalItems;
    CGFloat contentOffsetY;
}
@property (weak, nonatomic) IBOutlet UIView *horizontalContainerView;

@property (weak, nonatomic) IBOutlet UIView *verticalContainerView;

@property (strong, nonatomic,readonly) SHHorizontalCollectionViewController *flashVC;
@property (strong, nonatomic,readonly) SHVerticalCollectionViewController *productsVC;

@property (strong, nonatomic) SHResponse *flashResponse;
@property (strong, nonatomic) SHResponse *homeResponse;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
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
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    [self.flashVC setFlashResponse:flashResponse];
}

- (void) setHomeResponse:(SHResponse *)homeResponse {
    _homeResponse = homeResponse;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    [_activityIndicator stopAnimating];
    [self.productsVC setHomeResponse:homeResponse];
}

- (void)loadHomeProductsWithPageNumber:(NSNumber *)pageNo {
    __weak SHHomeTableTableViewController *weakSelf = self;
    [[SHServiceManager sharedManager] getWithPath:@"api/home/" parameters:@{@"PAGED": pageNo} returnType:[SHResponse class] completionBlock:^(SHResponse *result, NSError *error) {
        self->isLoading = NO;
        self->totalItems += result.output.data.items.count;
        [weakSelf setHomeResponse:result];
    }];
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SHResponseMapper configure];
    
    isLoading = YES;
    totalItems = 0;
    contentOffsetY = 0;
    
    __weak SHHomeTableTableViewController *weakSelf = self;
    
    [[SHServiceManager sharedManager] getWithPath:@"api/flash/" parameters:nil returnType:[SHResponse class] completionBlock:^(SHResponse *result, NSError *error) {
        [weakSelf setFlashResponse:result];
    }];
    
    [self loadHomeProductsWithPageNumber:@(0)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)btnLeftArrowPressed:(id)sender {
    [self.flashVC scrollWith:ScrollDirectionLeft];
}

- (IBAction)btnRightArrowPressed:(id)sender {
    [self.flashVC scrollWith:ScrollDirectionRight];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] == ViewTypeVerticalCollection)  {
        unsigned long numRows = totalItems/2;
        return (CGFloat)numRows * 280.0;
    }if ([indexPath row] == ViewTypeHorizontalCollection)  {
        return 300.0;
    }
    return 44.0;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SHOutputNavigation *navigation = _homeResponse.output.navigation;
    if ([navigation.page intValue] < [navigation.maxPage intValue] || totalItems == 0) {
        return 3;
    }
    return 2;
}

#pragma mark - ScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat scrollViewContenteHeight = scrollView.contentSize.height;
    CGFloat currentOffset = scrollView.contentOffset.y;
    int endOfPage = (int)(currentOffset + scrollView.frame.size.height) >=  (int)(scrollViewContenteHeight);
    if (_homeResponse != nil && endOfPage && !isLoading){
        isLoading = YES;
        SHOutputNavigation *navigation = _homeResponse.output.navigation;
        if ([navigation.page intValue] < [navigation.maxPage intValue]) {
            [_activityIndicator startAnimating];
            [self loadHomeProductsWithPageNumber:@([navigation.page intValue]+1)];
        }
    }
}

@end
