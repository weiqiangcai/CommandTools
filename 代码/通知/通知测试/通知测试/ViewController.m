//
//  ViewController.m
//  通知测试
//
//  Created by 程杰 on 2019/8/27.
//  Copyright © 2019 miotlink. All rights reserved.
//

/**
 
 9、相关工具推荐
 
 Knuff离线push工具下载链接：https://github.com/KnuffApp/Knuff/releases
 
 https://github.com/noodlewerk/NWPusher/releases/tag/0.7.5
 
 在iOS10之前，如果应用在前台运行，来了新通知，是无法使用系统提醒的。
 
 关于APNs的更新有以下几点：
 
 在iOS上可以通过以下几种触发器来触发本地push：
 
 1）UNCalendarNotificationTrigger 传送本地通知的日期和时间；
 2）UNTimeIntervalNotificationTrigger 传递本地通知之前必须过期的时间；
 3）UNLocationNotificationTrigger 用户必须达到的地理位置才能提供本地通知；
 4）UNPushNotificationTrigger 表示通知是从Apple推送通知服务发送的对象。
 
 
 （1）名词解释之APNs
 
 APNs：Apple Push Notification service(苹果推送通知服务)。
 
 APNs主要用于以下场景：当用户主动杀掉 APP，或者 APP 进入后台超过约定时长时，APP会被kill，这样保障了前台 APP 的流畅性，也延长了手机的使用时长，获得了较好的用户体验，但是这也意味着，服务器无法主动和用户交互（如推送实时消息等），所以苹果推出了 APNs，允许设备和服务器分别与苹果的推送通知服务器保持长连接状态。
 
 关于APNs的更新有以下几点：
 
 iOS 8以后，APNs推送的字节是2k，iOS8以前是256字节；
 iOS 9以后APNs支持HTTP/2协议栈，优化长连接，具有标准的HTTP返回和管道复用技术；
 iOS 10以后，推送的字节是4k，APNs可根据推送消息的唯一标示符查询某条消息是否被用户阅读，可更新某一推送消息，而不用发重读的多条消息。

 
 
 （2）名词解释之payload
 
 什么是payload？对于每一条发送给APNs的推送消息，都包含一个payload，通常是组成了一个JSON的Dictionary，这其中必不可少的是aps属性，它对应的value也是一个Dictionary，包含一些但不限于以下内容：标题、副标题、内容、附件、category等，如
 
 3）名词解释之device token
 
 什么是device token？我们看一下官方的简介：
 device token: APNs uses device tokens to identify each unique app and device combination. It also uses them to authenticate the routing of remote notifications sent to a device.(device token是APNs用于区分识别每个iOS设备和设备上不同app的一个标识符，还可以用于APNs通过它将推送消息路由到指定设备上)
 
 
 即：device token里包含了device id和bundle id的信息，但是device id和bundle id不会确定唯一的device token。
 
 但是，这里有个坑，查资料得知，iOS8及之前的iOS系统，对于同一部手机，如果卸载后重装APP的话，device token是不会变的，在token变了以后，老的token，就被认为是无效了，苹果不会对这部分无效的token推送。但是，对iOS9及以后的iOS系统，对于同一部手机，卸载后重装APP的device token是会发生变化的，而且老的token不会无效，还可以正常推送，这应该是苹果的一个bug，但是苹果也没有修复这个问题，所以这个需要开发者自己来解决，否则容易出现一个app收到多个push的问题。
 
 
 【离线push详细流程】
 1) 首先是应用程序注册消息推送；
 2) iOS跟APNS Server要deviceToken。应用程序接受deviceToken；
 3) 应用程序将deviceToken发送给PUSH服务端程序；
 4) 服务端程序向APNS服务发送消息；
 5) APNS服务将消息发送给iPhone应用程序。
 
 值得注意的是，当由于用户反复卸载重装程序（虽然概率很小）等原因导致多个device Token指向同一台设备的同一个app，又把多个device Token发给APNs时，用户就会收到多条push。苹果APNs是不会对多个device Token是否指向同一台设备的同一个app做校验的，所以需要后台来做去重等处理保证用户不会收到多条push。
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - iOS10之前

/// iOS10之前的本地push
- (void)beforeiOS10LocalPush {
    
 
    
}


@end
