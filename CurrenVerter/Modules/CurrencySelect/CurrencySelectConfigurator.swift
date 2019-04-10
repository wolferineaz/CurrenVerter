//
//  CurrencySelectConfigurator.swift
//  CurrenVerter
//  Module: CurrencySelect
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencySelectConfigurator {
    func configure(_ controller: CurrencySelectViewController)
}

class CurrencySelectConfiguratorImpl: CurrencySelectConfigurator {

    func configure(_ controller: CurrencySelectViewController) {
        let router = CurrencySelectRouterImpl(view: controller)
        controller.presenter = CurrencySelectPresenterImpl(view: controller, router: router)
    }

}
