//
//  FSResultViewController.m
//  FSSearchController
//
//  Created by 四维图新 on 15/12/13.
//  Copyright (c) 2015年 四维图新. All rights reserved.
//

#import "FSResultViewController.h"

@interface FSResultViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FSResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    
    self.tableView = tableView;
    
    CGRect frame = self.view.frame;
    
    tableView.frame = CGRectMake(0, -44, frame.size.width, frame.size.height);
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
}

- (void)setResultArr:(NSArray *)resultArr
{
    _resultArr = resultArr;
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell1"];
        
        cell.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        
    }
    
    cell.textLabel.text = self.resultArr[indexPath.row];
    
    return cell;

}




@end







