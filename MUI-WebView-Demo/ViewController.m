//
//  ViewController.m
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/22.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "ViewController.h"
#import "TestWebViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *arr;
@end

@implementation ViewController

- (NSMutableArray *)arr {
    if (_arr == nil) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"webView集成";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];

    self.navigationController.navigationBar.translucent = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    
    [self addRow:@"基本交互" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plugin.html"]];
    [self addRow:@"拍照/录像" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/camera.html"]];
}

- (void)addRow:(NSString *)title url:(NSString *)url {
    [self.arr addObject:@{@"title": title, @"url": url}];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.arr[indexPath.row];
    TestWebViewController *web = [[TestWebViewController alloc] initWithTitle:dic[@"title"] URL:dic[@"url"]];
    [self.navigationController pushViewController:web animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.arr[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = dic[@"title"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
    
- (IBAction)pushWeb:(id)sender {
    TestWebViewController *web = [[TestWebViewController alloc] init];
    [self.navigationController pushViewController:web animated:YES];
}

@end
