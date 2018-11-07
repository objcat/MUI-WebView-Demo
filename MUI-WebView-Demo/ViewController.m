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
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"1.demo中使用的功能均基于基础库 所以请先集成基础库!!!\n2.demo并不是专为webview模式来写的 所以有部分跳转是无法使用的\n3.demo还处于开发阶段 功能并不全 请见谅" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *determin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    [alert addAction:determin];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)addRow {
    
     NSString *path = [[NSBundle mainBundle] bundlePath];
    
    [self addRowWithTitle:@"基础库 - 开始集成" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plugin.html"] staticLib:@[@"liblibPDRCore.a", @"libcoreSupport.a", @"liblibUI.a", @"liblibPGInvocation.a"] systemLib:@[@"libc++.tbd", @"StoreKit.framework", @"QuickLook.framework", @"AudioToolbox.framework", @"CoreTelephony.framework", @"MobileCoreServices.framework", @"JavaScriptCore.framework", @"MediaPlayer.framework", @"WebKit.framework"]];
    
    [self addRowWithTitle:@"加速度传感器" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/accelerometer.html"] staticLib:@[@"liblibAccelerometer.a"] systemLib:@[]];
    
    [self addRowWithTitle:@"音频录制/播放" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/audio.html"] staticLib:@[@"liblibMedia.a", @"libopencore-amrnb.a", @"libmp3lame.a", @"liblibIO.a"] systemLib:@[@"AVFoundation.framework"] privacys:@[]];
    
    [self addRowWithTitle:@"二维码扫描" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/barcode_scan.html"] staticLib:@[@"liblibBarcode.a", @"liblibNativeUI.a"] systemLib:@[@"AVFoundation.framework", @"CoreMedia.framework"]];
    
    [self addRowWithTitle:@"拍照/录像" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/camera.html"] staticLib:@[@"liblibCamera.a", @"liblibIO.a"] systemLib:@[@"AVFoundation.framework", @"AssetsLibrary.framework", @"Photos.framework", @"CoreLocation.framework", @"CoreMedia.framework"] privacys:@[@"Privacy - Camera Usage Description", @"Privacy - Microphone Usage Description"]];
    
    [self addRowWithTitle:@"获取设备信息" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/device.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"下载管理" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/downloader.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"系统事件" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/events.html"] staticLib:@[@"- (void)applicationDidEnterBackground:(UIApplication *)application", @"applicationWillEnterForeground:(UIApplication *)application"] systemLib:@[]];
    
    [self addRowWithTitle:@"文件系统" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/file.html"] staticLib:@[@"liblibIO.a"] systemLib:@[]];
    
    [self addRowWithTitle:@"系统相册" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/gallery.html"] staticLib:@[@"liblibCamera.a"] systemLib:@[@"AVFoundation.framework", @"AssetsLibrary.framework", @"Photos.framework", @"CoreLocation.framework", @"CoreMedia.framework"] privacys:@[@"Privacy - Photo Library Usage Description"]];
    
    [self addRowWithTitle:@"地理定位" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/geolocation.html"] staticLib:@[@"liblibGeolocation.a", @"libBaiduKeyVerify.a", @"libssl.a", @"libcrypto.a", @"BaiduMapAPI_Base.framework", @"BaiduMapAPI_Location.framework", @"BaiduMapAPI_Search.framework", @"BaiduMapAPI_Utils.framework"] systemLib:@[@"libsqlite3.0.tbd", @"CoreLocation.framework"] privacys:@[@"Privacy - Location When In Use Usage Description"]];
    
    [self addRowWithTitle:@"地图" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/maps.html"] staticLib:@[@"liblibMap.a", @"libbmapimp.a" , @"libBaiduKeyVerify.a", @"libssl.a", @"libcrypto.a", @"BaiduMapAPI_Base.framework", @"BaiduMapAPI_Location.framework", @"BaiduMapAPI_Search.framework", @"BaiduMapAPI_Utils.framework"] systemLib:@[@"libsqlite3.0.tbd", @"MapKit.framework"] privacys:@[@"地图组件不推荐使用 写的很垃圾 libbmapimp 强行跟百度地图关联 导致简单的openURL都要导入百度的sdk"]];
    
    [self addRowWithTitle:@"消息通讯" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/message.html"] staticLib:@[@"liblibMessage.a"] systemLib:@[@"MessageUI.framework"]];
    
    [self addRowWithTitle:@"原生对象" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/nativeobj.html"] staticLib:@[@"liblibNativeUI.a"] systemLib:@[]];
    
    [self addRowWithTitle:@"原生界面" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/nativeui.html"] staticLib:@[@"liblibNativeUI.a"] systemLib:@[]];
    
    [self addRowWithTitle:@"浏览器环境" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/navigator.html"] staticLib:@[@"liblibNavigator.a"] systemLib:@[@"AddressBook.framework", @"CoreLocation.framework", @"AssetsLibrary.framework", @"AVFoundation.framework"]];
    
    [self addRowWithTitle:@"授权登陆认证" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/oauth.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"方向传感器" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/orientation.html"] staticLib:@[@"liblibNativeUI.a", @"liblibOrientation.a"] systemLib:@[@"CoreLocation.framework"]];
    
    [self addRowWithTitle:@"支付" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/payment.html"] staticLib:@[@"liblibNativeUI.a", @"libalixpayment.a", @"liblibPayment.a", @"AlipaySDK.framework"] systemLib:@[@"CoreMotion.framework"]];
    
    [self addRowWithTitle:@"距离传感器" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/proximity.html"] staticLib:@[@"liblibPGProximity.a"] systemLib:@[@"基础库"]];
    
    [self addRowWithTitle:@"消息推送" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/push.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"运行环境" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/runtime.html"] staticLib:@[] systemLib:@[@"基础库"]];
    
    [self addRowWithTitle:@"分享" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/share.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"语音识别" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/speech.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"统计管理" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/statistic.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"本地数据存储" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/storage.html"] staticLib:@[@"liblibStorage.a", @"storage.framework"] systemLib:@[]];
    
    [self addRowWithTitle:@"上传管理" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/uploader.html"] staticLib:@[@"liblibNativeUI.a", @"liblibStorage.a", @"liblibCamera.a", @"storage.framework", @"CoreLocation.framework", @"Photos.framework", @"AssetsLibrary.framework", @"AVFoundation.framework"] systemLib:@[@"CoreMedia.framework"]];
    
    [self addRowWithTitle:@"视频多媒体" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/video.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"窗口管理" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/webview.html"] staticLib:@[] systemLib:@[]];
    
    [self addRowWithTitle:@"跨域请求" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/xhr.html"] staticLib:@[@"liblibXHR.a"] systemLib:@[]];
    
    [self addRowWithTitle:@"文件压缩解压" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/zip.html"] staticLib:@[@"liblibZip.a", @"liblibIO.a", @"liblibNativeUI.a"] systemLib:@[@"基础库"]];
    
    [self addRowWithTitle:@"JS调用原生代码" url:[NSString stringWithFormat:@"file://%@/%@", path, @"Pandora/apps/HelloH5/www/plus/njs.html"] staticLib:@[] systemLib:@[@"基础库"]];
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
    
    if (model == self.arr[0]) {
        model.open = YES;
    }
}

- (void)addRowWithTitle:(NSString *)title url:(NSString *)url  staticLib:(NSArray *)staticLib systemLib:(NSArray *)systemLib privacys:(NSArray *)privacys {
    RowModel *model = [[RowModel alloc] init];
    model.title = title;
    model.url = url;
    model.staticLib = staticLib;
    model.systemLib = systemLib;
    model.privacys = privacys;
    [self.arr addObject:model];
    
    if (model == self.arr[0]) {
        model.open = YES;
    }
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
