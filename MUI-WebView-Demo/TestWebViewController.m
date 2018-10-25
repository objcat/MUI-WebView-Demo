//
//  TestWebViewController.m
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/23.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "TestWebViewController.h"
#import "PDRCoreAppFrame.h"
#import "PDRCoreAppManager.h"

@interface TestWebViewController ()
@property (strong, nonatomic) PDRCoreAppFrame *appFrame;
@property (strong, nonatomic) NSString *url;
@end

@implementation TestWebViewController

- (instancetype)initWithTitle:(NSString *)title URL:(NSString *)URL {
    self = [super init];
    if (self) {
        self.navigationItem.title = title;
        self.url = URL;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    PDRCore *pCoreHandle = [PDRCore Instance];
    if (pCoreHandle) {
        [pCoreHandle start];
        self.appFrame = [[PDRCoreAppFrame alloc] initWithName:@"WebViewID1" loadURL:self.url frame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
        if (self.appFrame) {
            [pCoreHandle.appManager.activeApp.appWindow registerFrame:self.appFrame];
            [pCoreHandle regPluginWithName:@"plugintest" impClassName:@"PGPluginTest" type:PDRExendPluginTypeFrame javaScript:nil];
            [self.view addSubview:self.appFrame];
        }
    }
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(received:) name:@"SendDataToNative" object:nil];
}

- (void)received:(NSNotification *)noti {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"原生界面收到了通知" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *determin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    [alert addAction:determin];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)dealloc {
    [[PDRCore Instance] setContainerView:nil];
}

@end
