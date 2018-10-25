//
//  PluginTest.m
//  HBuilder-Hello
//
//  Created by Mac Pro on 14-9-3.
//  Copyright (c) 2014年 DCloud. All rights reserved.
//

#import "PluginTest.h"
#import "PDRCoreAppFrame.h"
#import "H5WEEngineExport.h"
#import "PDRToolSystemEx.h"
// 扩展插件中需要引入需要的系统库
#import <LocalAuthentication/LocalAuthentication.h>

@implementation PGPluginTest

#pragma mark 以下为插件方法，由JS触发， WebView集成和WebApp集成都可以触发
- (void)PluginTestFunction:(PGMethod *)commands {
    
    if (commands) {
        
        // 异步方法的回调id，H5+ 会根据回调ID通知JS层运行结果成功或者失败
        NSString *cbId = [commands.arguments objectAtIndex:0];

        /**
         用户的参数会在第二个参数开始传回
         这里说一下 通过观察控制台可以发现 返回的arguments实际上是一个数组 无论你是否传值 都只有五个参数
         第一个参数为对调id是自动生成的
         所以用户可以控制的参数为实际上为4个 无论是否传值 均存在 若不传值 默认为 NSNull
         */
        NSString *pArgument1 = [commands.arguments objectAtIndex:1];
        NSString *pArgument2 = [commands.arguments objectAtIndex:2];
        NSString *pArgument3 = [commands.arguments objectAtIndex:3];
        NSDictionary *pArgument4 = [commands.arguments objectAtIndex:4];
        
        // 如果使用Array方式传递参数
        NSArray *pResultArray = [NSArray arrayWithObjects:pArgument1, pArgument2, pArgument3, pArgument4, nil];

        PDRPluginResult *result = [PDRPluginResult resultWithStatus:PDRCommandStatusOK messageAsArray: pResultArray];
        
//        PDRPluginResult *result = [PDRPluginResult resultWithStatus:PDRCommandStatusOK messageAsDictionary:@{@"key": @"value"}];
        
        // 通知JS层Native层运行结果
        [self toCallback:cbId withReslut:[result toJSONString]];
    }
}


// 调用指纹解锁
- (void)AuthenticateUser:(PGMethod*)command
{
    if (nil == command) {
        return;
    }
    BOOL isSupport = false;
    NSString* pcbid = [command.arguments objectAtIndex:0];
    NSError* error = nil;
    NSString* LocalReason = @"HBuilder指纹验证";
    
    // Touch ID 是IOS 8 以后支持的功能
    if ([PTDeviceOSInfo systemVersion] >= PTSystemVersion8Series) {
        LAContext* context = [[LAContext alloc] init];
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
            isSupport = true;
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:LocalReason reply:^(BOOL success, NSError * _Nullable error) {
                PDRPluginResult * pResult = nil;
                
                if (success) {
                    
                    pResult = [PDRPluginResult resultWithStatus: PDRCommandStatusOK messageAsDictionary:@{@"state":@(0), @"message":@"成功"}];
                }
                else{
                    NSDictionary* pStringError = nil;
                    switch (error.code) {
                        case LAErrorSystemCancel:
                        {
                            pStringError = @{@"state":@(-1), @"message":@"系统取消授权(例如其他APP切入)"};
                            break;
                        }
                        case LAErrorUserCancel:
                        {
                            pStringError = @{@"state":@(-2), @"message":@"用户取消Touch ID授权"};
                            break;
                        }
                        case LAErrorUserFallback:
                        {
                            pStringError  = @{@"state":@(-3), @"message":@"用户选择输入密码"};
                            break;
                        }
                        case LAErrorTouchIDNotAvailable:{
                            pStringError  = @{@"state":@(-4), @"message":@"设备Touch ID不可用"};
                            break;
                        }
                        case LAErrorTouchIDLockout:{
                            pStringError  = @{@"state":@(-5), @"message":@"Touch ID被锁"};
                            break;
                        }
                        case LAErrorAppCancel:{
                            pStringError  = @{@"state":@(-6), @"message":@"软件被挂起取消授权"};
                            break;
                        }
                        default:
                        {
                            pStringError  = @{@"state":@(-7), @"message":@"其他错误"};
                            break;
                        }
                    }
                    pResult = [PDRPluginResult resultWithStatus:PDRCommandStatusError messageAsDictionary:pStringError];
                    
                }
                
                [self toCallback:pcbid withReslut:[pResult toJSONString]];
            }];
        }
        else{
            NSDictionary* pStringError = nil;
            switch (error.code) {
                case LAErrorTouchIDNotEnrolled:
                {
                    pStringError  = @{@"state":@(-11), @"message":@"设备Touch ID不可用"};
                    break;
                }
                case LAErrorPasscodeNotSet:
                {
                    pStringError  = @{@"state":@(-12), @"message":@"用户未录入Touch ID"};
                    break;
                }
                    
                default:
                    break;
            }
        }
    }
   
    if (!isSupport) {
        PDRPluginResult* pResult = [PDRPluginResult resultWithStatus:PDRCommandStatusError messageAsString:@"Device Not Support"];
        [self toCallback:pcbid withReslut:[pResult toJSONString]];
    }
}


- (NSData*)PluginTestFunctionSync:(PGMethod*)command
{
    // 根据传入获取参数
    NSString* pArgument1 = [command.arguments objectAtIndex:0];
    NSString* pArgument2 = [command.arguments objectAtIndex:1];
    NSString* pArgument3 = [command.arguments objectAtIndex:2];
    NSString* pArgument4 = [command.arguments objectAtIndex:3];
    
    // 拼接成字符串
    NSString* pResultString = [NSString stringWithFormat:@"%@ %@ %@ %@", pArgument1, pArgument2, pArgument3, pArgument4];

    // 按照字符串方式返回结果
    return [self resultWithString: pResultString];
}


- (NSData*)PluginTestFunctionSyncArrayArgu:(PGMethod*)command
{
    // 根据传入参数获取一个Array，可以从中获取参数
    NSArray* pArray = [command.arguments objectAtIndex:0];
    
    // 创建一个作为返回值的NSDictionary
    NSDictionary* pResultDic = [NSDictionary dictionaryWithObjects:pArray forKeys:[NSArray arrayWithObjects:@"RetArgu1",@"RetArgu2",@"RetArgu3", @"RetArgu4", nil]];

    // 返回类型为JSON，JS层在取值是需要按照JSON进行获取
    return [self resultWithJSON: pResultDic];
}




#pragma mark 这个方法在使用WebApp方式集成时触发，WebView集成方式不触发

/*
 * WebApp启动时触发
 * 需要在PandoraApi.bundle/feature.plist/注册插件里添加autostart值为true，global项的值设置为true
 */
- (void) onAppStarted:(NSDictionary*)options{
    
    NSLog(@"5+ WebApp启动时触发");
    // 可以在这个方法里向Core注册扩展插件的JS
    
}

// 监听基座事件事件
// 应用退出时触发
- (void) onAppTerminate{
    //
    NSLog(@"APPDelegate applicationWillTerminate 事件触发时触发");
}

// 应用进入后台时触发
- (void) onAppEnterBackground{
    //
    NSLog(@"APPDelegate applicationDidEnterBackground 事件触发时触发");
}

// 应用进入前天时触发
- (void) onAppEnterForeground{
    //
    NSLog(@"APPDelegate applicationWillEnterForeground 事件触发时触发");
}


@end
