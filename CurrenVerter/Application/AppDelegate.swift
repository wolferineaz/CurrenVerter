//
//  AppDelegate.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return RootRouterImpl.default.application(didFinishLaunchingWithOptions: launchOptions)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        CoreData.manager.saveContext()
    }

}

