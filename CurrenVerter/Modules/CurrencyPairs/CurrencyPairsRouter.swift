//
//  CurrencyPairsRouter.swift
//  CurrenVerter
//  Module: CurrencyPairs
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencyPairsRouter {

}

class CurrencyPairsRouterImpl: CurrencyPairsRouter {
    fileprivate weak var view: CurrencyPairsViewController?

    init(view: CurrencyPairsViewController) {
        self.view = view
    }

}
