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

}

class CurrencySelectRouterImpl: CurrencySelectRouter {
    fileprivate weak var view: CurrencySelectViewController?

    init(view: CurrencySelectViewController) {
        self.view = view
    }

}
