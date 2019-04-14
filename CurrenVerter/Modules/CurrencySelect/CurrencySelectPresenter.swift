//
//  CurrencySelectPresenter.swift
//  CurrenVerter
//  Module: CurrencySelect
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencySelectPresenter {
    func viewDidLoad()
    func onSelect(_ currencyData: CurrencyTableCellData)
}

class CurrencySelectPresenterImpl: CurrencySelectPresenter {
    fileprivate weak var view: CurrencySelectView?
    fileprivate let router: CurrencySelectRouter

    var firstCurrency: Currency?
    var currencies = Currency.all()

    func viewDidLoad() {
        self.view?.show(self.currencies)
    }

    init(view: CurrencySelectView,
         router: CurrencySelectRouter,
         firstCurrency: Currency?) {
        self.view = view
        self.router = router
        self.firstCurrency = firstCurrency
    }

    func onSelect(_ currencyData: CurrencyTableCellData) {

        guard let currency = self.currencies.first(where: { $0.identifier == currencyData.currencyIdentifier }) else { return }

        if let firstCurrency = self.firstCurrency {
            let pair = CoreData.manager.save(pairWith: firstCurrency, to: currency)
            self.router.onAddPair(pair)
        } else {
            self.router.showCurrenciesWith(currency)
        }
    }

}
