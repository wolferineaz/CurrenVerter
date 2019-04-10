//
//  RootRouter.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol RootRouter {
    func setRootViewController()
    func application(didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
}

class RootRouterImpl: RootRouter {

    static var `default` = RootRouterImpl()

    var window: UIWindow?

    func application(didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setRootViewController()
        return true
    }

    func setRootViewController() {
        let rootController: UIViewController = {
            let controller = CurrencyPairsViewController()
            controller.configurator = CurrencyPairsConfiguratorImpl()
            return controller
        }()

        self.window = UIWindow()
        self.window?.rootViewController = rootController.wrapToNavigation()
        self.window?.makeKeyAndVisible()
    }

}
