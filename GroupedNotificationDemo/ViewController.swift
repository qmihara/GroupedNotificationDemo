//
//  ViewController.swift
//  GroupedNotificationDemo
//
//  Created by Kyusaku Mihara on 2018/06/19.
//  Copyright © 2018 epohsoft. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    @IBOutlet weak var deviceTokenLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func localNotificationButtonDidTap(_ sender: Any) {
        sendLocalNotification()
    }

    @IBAction func threadLocalNotificationButtonDidTap(_ sender: UIButton) {
        sendLocalNotification(withThraedIdentifier: "thread\(sender.tag)")
    }

    private func sendLocalNotification(withThraedIdentifier threadIdentifier: String? = nil) {
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.subtitle = "thread identifier is \(threadIdentifier ?? "nil")"
        content.body = "Body"
        content.sound = .default
        if let threadIdentifier = threadIdentifier {
            content.threadIdentifier = threadIdentifier
        }

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString
            , content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }
}
