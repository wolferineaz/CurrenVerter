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

    var firstCurrency: Currency?

    func configure(_ controller: CurrencySelectViewController) {
        let router = CurrencySelectRouterImpl(view: controller)
        controller.presenter = CurrencySelectPresenterImpl(view: controller,
                                                           router: router,
                                                           firstCurrency: self.firstCurrency)
    }

    init(_ currency: Currency?) {
        self.firstCurrency = currency
    }

}
