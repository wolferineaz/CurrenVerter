//
//  CurrencyPairsConfigurator.swift
//  CurrenVerter
//  Module: CurrencyPairs
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencyPairsConfigurator {
    func configure(_ controller: CurrencyPairsViewController)
}

class CurrencyPairsConfiguratorImpl: CurrencyPairsConfigurator {

    func configure(_ controller: CurrencyPairsViewController) {
        let router = CurrencyPairsRouterImpl(view: controller)
        controller.presenter = CurrencyPairsPresenterImpl(view: controller, router: router)
    }

}
