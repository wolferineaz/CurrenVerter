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
}

class CurrencySelectPresenterImpl: CurrencySelectPresenter {
    fileprivate weak var view: CurrencySelectView?
    fileprivate let router: CurrencySelectRouter

    func viewDidLoad() {
        self.view?.show(Currency.all())
    }

    init(view: CurrencySelectView, router: CurrencySelectRouter) {
        self.view = view
        self.router = router
    }

}
