//
//  AppDelegate.swift
//  MyMe
//
//  Created by Pietro Santececca on 19.02.19.
//  Copyright © 2019 Tecnojam. All rights reserved.
//

import UIKit
import Apollo
import FacebookCore
import SwiftKeychainWrapper

let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigator = Navigator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        SDKApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        navigator.show(.initialLoadingView)
        DataManager.isUserLogged { [weak self] isLogged in
            if (isLogged) {
                self?.navigator.show(.initialCompassView)
            }
            else {
                self?.navigator.show(.initialLoginView)
            }
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return SDKApplicationDelegate.shared.application(app, open: url, options: options)
    }

    func setInitialViewController(_ vc: UIViewController) {
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }

}

