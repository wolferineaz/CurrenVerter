//
//  CurrencyPairsPresenter.swift
//  CurrenVerter
//  Module: CurrencyPairs
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencyPairsPresenter {
    func viewDidLoad()
    func reloadPairs()
    func onClickAddNewPair()
}

class CurrencyPairsPresenterImpl: CurrencyPairsPresenter {
    fileprivate weak var view: CurrencyPairsView?
    fileprivate let router: CurrencyPairsRouter

    func viewDidLoad() {

    }

    func reloadPairs() {
        let pairs = CoreData.manager.pairs()
        self.view?.show(pairs ?? [CurrencyPair]())
    }

    func onClickAddNewPair() {
        self.router.showCurrencies()
    }

    init(view: CurrencyPairsView, router: CurrencyPairsRouter) {
        self.view = view
        self.router = router
    }

}
