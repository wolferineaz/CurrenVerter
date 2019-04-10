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
}

class CurrencyPairsPresenterImpl: CurrencyPairsPresenter {
    fileprivate weak var view: CurrencyPairsView?
    fileprivate let router: CurrencyPairsRouter

    func viewDidLoad() {

        let pairs = [CurrencyPair]()
        self.view?.show(pairs)

    }

    init(view: CurrencyPairsView, router: CurrencyPairsRouter) {
        self.view = view
        self.router = router
    }

}
