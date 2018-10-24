//
//  ViewController.m
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/22.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "ViewController.h"
#import "TestWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
    
- (IBAction)pushWeb:(id)sender {
    TestWebViewController *web = [[TestWebViewController alloc] init];
    [self.navigationController pushViewController:web animated:YES];
}

@end
