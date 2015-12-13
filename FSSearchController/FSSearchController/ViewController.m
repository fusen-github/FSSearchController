//
//  ViewController.m
//  FSSearchController
//
//  Created by 四维图新 on 15/12/13.
//  Copyright (c) 2015年 四维图新. All rights reserved.
//

#import "ViewController.h"
#import "FSDataModel.h"
#import "FSResultViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) UITableView *tabelView;

@property (nonatomic, strong) NSMutableArray *searchResults;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.searchResults = [NSMutableArray array];
    
    [self requestData];
    
    [self setupTableView];
    
    UISearchBar *searchBar = self.searchController.searchBar;
    
    searchBar.frame = CGRectMake(0, 0, searchBar.bounds.size.width, 40);

    self.tabelView.tableHeaderView = searchBar;
}

- (void)requestData
{
    self.dataArr = [FSDataModel dataModelArr];
    
    [self.tabelView reloadData];
}

- (void)setupTableView
{
    CGRect tabelViewFrame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    UITableView *tabelView = [[UITableView alloc] initWithFrame:tabelViewFrame style:UITableViewStyleGrouped];
    
    self.tabelView = tabelView;
    
    tabelView.delegate = self;
    
    tabelView.dataSource = self;
    
    [self.view addSubview:tabelView];
    
    FSResultViewController *resultVC = [[FSResultViewController alloc] init];
    
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:resultVC];
    
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:resultVC];
    
    self.searchController = searchController;
    
    searchController.searchBar.placeholder = @"请输入关键字...";
    
    searchController.searchResultsUpdater = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    FSDataModel *model = self.dataArr[indexPath.row];
    
    cell.textLabel.text = model.name;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}

/**
 *  当搜索框成为第一响应 或者 搜索框的文本内容发生改变的时候调用。
 */
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
    if (searchController.searchBar.text.length)
    {
        [self.searchResults removeAllObjects];
        
        [self.dataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
           
            FSDataModel *model = (FSDataModel *)obj;
            
            if ([model.name containsString:searchController.searchBar.text])
            {
                [self.searchResults addObject:model.name];
            }
            
        }];
        
    }
    
    
    
    if (self.searchController.searchResultsController)
    {
        FSResultViewController *resultVC = (FSResultViewController *)self.searchController.searchResultsController;
        
        resultVC.resultArr = self.searchResults;
    }
    
}







@end
