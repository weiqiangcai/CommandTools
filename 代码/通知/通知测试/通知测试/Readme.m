/**
 
 {
 "aps" : {
 "alert" : {
 "title" : "Introduction to Notifications",
 "subtitle" : "Session 707",
 "body" : "Woah! These new notifications look amazing! Don’t you agree?"
 },
 "badge" : 1
 },
 }
 
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        self.isFirstLaunch = YES;
    //这里是获取推送内容
        NSDictionary* remoteNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (remoteNotification) {
                //点击通知框进入app可以在此接收通知（只在杀死状态下可以接收到）,之后会调用didReceiveRemoteNotification,因为此方法调用时,控制器已经创建完毕，可以跳转
            }else{
                    //点击图标进入app
               }
    //这里要注册推送服务
       if (kOS >= 10.0) { // 设置能够接收通知 的类型
               UNUserNotificationCenter * center = [UNUserNotificationCenter currentNotificationCenter];
                [center setDelegate:self];
               UNAuthorizationOptions type = UNAuthorizationOptionBadge|UNAuthorizationOptionSound|UNAuthorizationOptionAlert;
               [center requestAuthorizationWithOptions:type completionHandler:^(BOOL granted, NSError * _Nullable error) {
                       if (granted) {
                               Log(@"注册成功");
                               [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                     Log(@"%@",settings);
                 }];
                                    }];
                           }else{
                                   Log(@"注册失败");
                               }
                   }];
           } else if (kOS >= 8.0){
                   UIUserNotificationType notificationTypes = UIUserNotificationTypeBadge |
                   UIUserNotificationTypeSound |
                   UIUserNotificationTypeAlert;
                   UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:notificationTypes categories:nil];
                   [application registerUserNotificationSettings:settings];
               }
       // 注册通知
        [application registerForRemoteNotifications];
       return YES;
}

接下来这是获得deviceToken的方法（deviceToken，是apns服务给每个设备的标示，通过这个标示才能推送到指定设备，且deviceToken是变化的，一般在应用卸载重装，或者系统升级才会改变）

// 1 每次程序启动都会调用
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
        //在这里把token传给后台
        NSString *deviceTokenStr = [[[[deviceToken description]
                                                                        stringByReplacingOccurrencesOfString:@"<" withString:@""]
                                                                     stringByReplacingOccurrencesOfString:@">" withString:@""]
                                                                   stringByReplacingOccurrencesOfString:@" " withString:@""];
       Log(@"deviceTokenStr:\n%@",deviceTokenStr);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:deviceTokenStr forKey:@"deviceToken"];
        [defaults synchronize];
    //这个方法 是我向后端数据库更新token的请求，如果用第三方推送可忽略
        [PushService updateDeviceToken];
}

didFailToRegisterForRemoteNotificationsWithError这个方法就不多说了，是token获取失败调用，我们可以在这里向后台注销这个用户的token        willPresentNotification这个方法在iOS10才有的，用来设置应用在前台运行时，收到通知的提醒模型

#pragma mark- UNUserNotificationCenterDelegate（iOS10以上）
//在前台收到通知（程序运行时走此方法）
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
       // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
        //如果加上这三个枚举，则用户即使在前台收到通知也会出现，有声音和角标。如果去掉在前台则不会收到
        completionHandler(UNNotificationPresentationOptionBadge|
                                               UNNotificationPresentationOptionSound|
                                               UNNotificationPresentationOptionAlert);
}

didReceiveNotificationResponse是应用处于任何状态下，用户点击了推送通知的弹框，就会调用
// iOS 10之后 任何状态用户点击了通知 （用户点击了通知时走此方法）
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
        NSDictionary *userInfo = response.notification.request.content.userInfo;
    //这里可以处理收到的推送消息
            if (userInfo[@"aps"][@"url"]) {
                    [ToolsHelper receiveMessageAndPushcontroller:userInfo[@"aps"][@"url"]];
                }
        }
   completionHandler();
    return;
}

didReceiveRemoteNotification  这个方法在iOS10以下，应用在前台的时候，有推送来，会直接来到这个方法，但通知栏不会有提示，角标也不会有，应用如果在后台后者关闭状态，点击推送来的消息也会来到这个方法，我们可以在这里处理业务逻辑（由于要处理iOS10以前设备在前台收到通知的提醒，所以要将通知转为本地通知进行弹窗提示）

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
       Log(@"userInfo: %@", userInfo.description);
       if ( application.applicationState == UIApplicationStateActive) {
                // 程序在运行过程中收到推送通知,转换成一个本地通知，显示到通知栏
                UILocalNotification *localNotification = [[UILocalNotification alloc] init];
                localNotification.userInfo = userInfo;
                localNotification.soundName = UILocalNotificationDefaultSoundName;
                localNotification.alertBody = [[userInfo objectForKey:@"aps"]objectForKey:@"alert"];
                localNotification.fireDate = [NSDate date];
                [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
           } else {
                   //在后台或者关闭状态收到推送通知
                }
       completionHandler(UIBackgroundFetchResultNewData);
}


*/
