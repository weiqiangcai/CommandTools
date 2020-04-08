//
//  AppDelegate.m
//  通知测试
//
//  Created by 程杰 on 2019/8/27.
//  Copyright © 2019 miotlink. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

//{
//    "aps" : {
//        "alert" : {
//            "title" : "Introduction to Notifications",
//            "subtitle" : "Session 707",
//            "body" : "Woah! These new notifications look amazing! Don’t you agree?"
//        },
//        "badge" : 1
//    },
//}




- (void)localNotificationCenter:(UNUserNotificationCenter *)center {
  
     if (@available(iOS 10.0, *)) {
    // 1. 获取推送通知中心
    
    // 2. 设置推送内容
   
        UNMutableNotificationContent *content = [UNMutableNotificationContent new];
         content.title = @"本地推送标题";
         content.subtitle = @"副标题";
         content.body = @"这个是推送的内容，你猜我会写点什么呢！！！哇哈哈哈";
         content.badge = @(20);
         content.categoryIdentifier = @"identifier";
         
         //        需要解锁显示，红色文字。点击不会进app。
         //        UNNotificationActionOptionAuthenticationRequired = (1 << 0),
         //
         //        黑色文字。点击不会进app。
         //        UNNotificationActionOptionDestructive = (1 << 1),
         //
         //        黑色文字。点击会进app。
         //        UNNotificationActionOptionForeground = (1 << 2),
         
         UNNotificationAction *action = [UNNotificationAction actionWithIdentifier:@"enterApp" title:@"进入应用" options:(UNNotificationActionOptionForeground)];
         UNNotificationAction *ingoreAction = [UNNotificationAction actionWithIdentifier:@"ignore" title:@"" options:UNNotificationActionOptionDestructive];
         
         UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"categoryIdentifier" actions:@[action ,ingoreAction] intentIdentifiers:@[] options:(UNNotificationCategoryOptionCustomDismissAction)];
    
         [center setNotificationCategories:[NSSet setWithObject:category]];
         
    // 3. 设置推送方式
         
         UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
         UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"requestid" content:content trigger:trigger];
    
    // 4. 添加推送request
         
         [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
             
             if (!error) {
                 NSLog(@"本地通知发送成功");
             }
         }];
         
         
     } else {
         // Fallback on earlier versions
     }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self createOneLocalNotification];
    
    return YES;
}
#pragma mark - 创建一条本地通知
- (void)createOneLocalNotification{
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"标题";
    content.subtitle = @"副标题";
    content.body = @"这里是通知内容";
    content.badge = @0;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image1" ofType:@"png"];
    NSError *error = nil;
    UNNotificationAttachment *img_attachment = [UNNotificationAttachment attachmentWithIdentifier:@"att1" URL:[NSURL fileURLWithPath:path] options:nil error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    content.attachments = @[img_attachment];
    //设置为@""以后，进入app将没有启动页
    content.launchImageName = @"";
    //收到通知时候的声音文件名(音频文件必须在bundle中或者在Library/Sounds目录下)
    UNNotificationSound *sound = [UNNotificationSound soundNamed:@"sound.wav"];
    content.sound = sound;
    //一秒后收到通知，并且不重复
    UNTimeIntervalNotificationTrigger *time_trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
    NSString *requestIdentifer = @"requestIdentifer";
    content.categoryIdentifier = @"category1";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifer content:content trigger:time_trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
     [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    
}

#pragma mark -增加的

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// 注册device token
    
    NSLog(@"%@", [NSString stringWithFormat:@"Device Token: %@", deviceToken]);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"error--:%@",error);
}

#pragma mark - UNUserNotificationCenterDelegate
//在前台收到通知（程序运行时走此方法）
// 第一个协议方法，是当应用在前台运行时调用，其 completionHandler 回调用于告诉系统以何种方式告知用户，来了新通知，参数为UNNotificationPresentationOptions 类型，有三个值可供选择：badge、alert、sound，如果没有调用completionHandler回调，则不会有提醒；在iOS10之前，如果应用在前台运行，来了新通知，是无法使用系统提醒的。
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler  API_AVAILABLE(ios(10.0)){
    
    
}
// iOS 10之后 任何状态用户点击了通知 （用户点击了通知时走此方法）
//第二个协议方法，是当应用在后台或者被杀死，当用户点击通知内容或者通知action时，会调用该方法，通过 UNNotificationResponse 实例可获取详细的信息
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler  API_AVAILABLE(ios(10.0)){
    
    NSString *categoryID = response.notification.request.content.categoryIdentifier;
    if ([categoryID isEqualToString:@"categoryIdentifier"]) {
        if ([response.actionIdentifier isEqualToString:@"enterApp"]) {
            if (@available(iOS 10.0, *)) {
                
            } else {
                // Fallback on earlier versions
            }
        }else{
            NSLog(@"No======");
        }
    }
    completionHandler();
    
    
}
// 第三个协议方法，是在app内展示通知的设置情况，需要在请求权限的options中添加 providesAppNotificationSettings，iOS12才支持
- (void)userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification  API_AVAILABLE(ios(10.0)){
    
}

#pragma mark - remoteNotif
- (void)remoteNotification:(UIApplication *) application {
    
    if (@available(iOS 10.0, *)) {
        
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        
        UNAuthorizationOptions types = UNAuthorizationOptionBadge | UNAuthorizationOptionAlert |
        UNAuthorizationOptionSound ;
        
        [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            NSLog(@"settings--:%@",settings);
            
            
            if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {  // 已授权
                
                
            } else if (settings.authorizationStatus == UNAuthorizationStatusNotDetermined) {
                // 未选择，请求授权
                [center requestAuthorizationWithOptions:types completionHandler:^(BOOL granted, NSError * _Nullable error) {
                    
                    if (!error) {
                        NSLog(@"授权成功");
                        
                    }
                    
                }];
                
            } else if (settings.authorizationStatus == UNAuthorizationStatusDenied) {// 拒绝，当用户拒绝后，需要在合适的时机进行提醒，而不应该是每次启动时都去提醒
                // 弹出提示框，引导用户开启
                // 弹出提示框，引导用户开启
                //                if let url = URL(string: UIApplication.openSettingsURLString) {
                //                    if UIApplication.shared.canOpenURL(url) {
                //                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                //                    }
            }
            
        }];
        
    } else if (@available(iOS 8.0, *)) {
        
        /// 消息类型
        UIUserNotificationType type  =  UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound ;
        /// 设置
        UIUserNotificationSettings *seting = [UIUserNotificationSettings settingsForTypes: type categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:seting];
    }
    
    /// 注册通知
    [application registerForRemoteNotifications];
}

@end
