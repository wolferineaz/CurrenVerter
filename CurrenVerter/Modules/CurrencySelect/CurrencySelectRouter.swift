//
//  CurrencySelectRouter.swift
//  CurrenVerter
//  Module: CurrencySelect
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencySelectRouter {
    func showCurrenciesWith(_ currency: Currency)
    func onAddPair(_ pair: CurrencyPair)
}

class CurrencySelectRouterImpl: CurrencySelectRouter {
    fileprivate weak var view: CurrencySelectViewController?

    init(view: CurrencySelectViewController) {
        self.view = view
    }

    func showCurrenciesWith(_ currency: Currency) {
        let controller = CurrencySelectViewController()
        controller.configurator = CurrencySelectConfiguratorImpl(currency)
        self.view?.navigationController?.pushViewController(controller, animated: true)
    }

    func onAddPair(_ pair: CurrencyPair) {
        self.view?.navigationController?.popToRootViewController(animated: true)
    }

}
