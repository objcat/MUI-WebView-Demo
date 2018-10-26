//
//  ViewController.m
//  MUI-WebView-Demo
//
//  Created by 张祎 on 2018/10/22.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "ViewController.h"
#import "TestWebViewController.h"
#import "RowTableViewCell.h"
#import "RowOpenTableViewCell.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
    [self addRow];
}

- (void)addRow {
    
     NSString *path = [[NSBundle mainBundle] bundlePath];
    
    [self addRowWithTitle:@"基本交互" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plugin.html"] staticLib:@[@"liblibPDRCore.a", @"libcoreSupport.a", @"liblibUI.a", @"liblibPGInvocation.a"] systemLib:@[@"libc++.tbd", @"StoreKit.framework", @"QuickLook.framework", @"AudioToolbox.framework", @"CoreTelephony.framework", @"MobileCoreServices.framework", @"JavaScriptCore.framework", @"MediaPlayer.framework", @"WebKit.framework"]];
    
    [self addRowWithTitle:@"加速度传感器" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/accelerometer.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"音频录制/播放" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/audio.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"二维码扫描" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/barcode_scan.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"拍照/录像" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/camera.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"获取设备信息" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/device.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"下载管理" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/downloader.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"系统事件" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/events.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"文件系统" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/file.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"系统相册" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/gallery.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"地理定位" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/geolocation.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"地图" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/maps.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"消息通讯" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/message.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"原生对象" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/nativeobj.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"原生界面" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/nativeui.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"浏览器环境" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/navigator.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"授权登陆认证" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/downloader.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"方向传感器" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/orientation.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"支付" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/payment.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"距离传感器" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/proximity.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"消息推送" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/push.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"运行环境" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/runtime.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"分享" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/share.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"语音识别" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/speech.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"统计管理" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/statistic.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"本地数据存储" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/storage.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"上传管理" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/uploader.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"视频多媒体" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/video.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"窗口管理" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/webview.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"跨域请求" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/xhr.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"文件压缩解压" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/zip.html"] staticLib:@[] systemLib:@[]];
    [self addRowWithTitle:@"JS调用原生代码" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/njs.html"] staticLib:@[] systemLib:@[]];
}

- (void)createTableView {
    self.navigationItem.title = @"h5+web";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.translucent = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"RowTableViewCell" bundle:nil] forCellReuseIdentifier:@"RowTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"RowOpenTableViewCell" bundle:nil] forCellReuseIdentifier:@"RowOpenTableViewCell"];
}

- (void)addRowWithTitle:(NSString *)title url:(NSString *)url  staticLib:(NSArray *)staticLib systemLib:(NSArray *)systemLib {
    RowModel *model = [[RowModel alloc] init];
    model.title = title;
    model.url = url;
    model.staticLib = staticLib;
    model.systemLib = systemLib;
    [self.arr addObject:model];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RowModel *model = self.arr[indexPath.row];
    TestWebViewController *web = [[TestWebViewController alloc] initWithTitle:model.title URL:model.url];
    [self.navigationController pushViewController:web animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    RowModel *model = self.arr[indexPath.row];
    
    // 多态
    BaseTableViewCell *cell;
    
    if (model.open) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"RowOpenTableViewCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"RowTableViewCell" forIndexPath:indexPath];
    }
    
    __weak typeof(self) weakSelf = self;
    
    [cell setOpenBlock:^{
        [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    
    cell.model = model;
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

- (NSMutableArray *)arr {
    if (_arr == nil) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}


@end
