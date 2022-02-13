//
//  NotificationUtil.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/12/22.
//

import Foundation

class NotificationUtil {
    static let logOutNotification = Notification.Name("logOut")
    static let hideBottomNavNotification = Notification.Name("hideBottomNavigation")
    static let showBottomNavNotification = Notification.Name("showBottomNavigation")
 
    static func hideBottomNavigation() {
        NotificationCenter.default.post(name: NotificationUtil.hideBottomNavNotification, object: nil)
    }
    
    static func showBottomNavigation() {
        NotificationCenter.default.post(name: NotificationUtil.showBottomNavNotification, object: nil)
    }
    
    static func logout() {
        NotificationCenter.default.post(name: NotificationUtil.logOutNotification, object: nil)
    }
    

}

