//
//  TestWebViewController.m
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/23.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "TestWebViewController.h"

#import "PDRToolSystem.h"
#import "PDRToolSystemEx.h"
#import "PDRCoreAppFrame.h"
#import "PDRCoreAppManager.h"
#import "PDRCoreAppWindow.h"
#import "PDRCoreAppInfo.h"

@interface TestWebViewController ()
@property (strong, nonatomic) PDRCoreAppFrame *contentView;
@end

@implementation TestWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    PDRCore *pCoreHandle = [PDRCore Instance];
    if (pCoreHandle) {
        NSString *pFilePath = [NSString stringWithFormat:@"file://%@/%@", [NSBundle mainBundle].bundlePath, @"Pandora/apps/HelloH5/www/plugin.html"];
        [pCoreHandle start];
        self.contentView = [[PDRCoreAppFrame alloc] initWithName:@"WebViewID1" loadURL:pFilePath frame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
        if (TARGET_IPHONE_SIMULATOR) {
            self.contentView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
        }
        if (self.contentView) {
            [pCoreHandle.appManager.activeApp.appWindow registerFrame:self.contentView];
            [pCoreHandle regPluginWithName:@"plugintest" impClassName:@"PGPluginTest" type:PDRExendPluginTypeFrame javaScript:nil];
            [self.view addSubview:self.contentView];
        }
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(received:) name:@"SendDataToNative" object:nil];
}

- (void)received:(NSNotification *)noti {
    NSLog(@"原生界面收到了通知");
}

- (void)dealloc {
    [[PDRCore Instance] setContainerView:nil];
}

@end
