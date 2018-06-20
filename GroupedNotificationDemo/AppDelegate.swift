//
//  AppDelegate.swift
//  GroupedNotificationDemo
//
//  Created by Kyusaku Mihara on 2018/06/19.
//  Copyright © 2018 epohsoft. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
            print(granted ? "Allowed" : "Not allowed")
        }
        application.registerForRemoteNotifications()
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let stringOfDeviceToken = deviceToken.map { String(format: "%.2hhx", $0) }.joined()
        print("deviceToken:\(stringOfDeviceToken)")
        (window?.rootViewController as? ViewController)?.deviceTokenLabel.text = stringOfDeviceToken
    }
}

