//
//  CurrencyPairsViewController.swift
//  CurrenVerter
//  Module: CurrencyPairs
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencyPairsView: class {

}

class CurrencyPairsViewController: UIViewController {

    var configurator: CurrencyPairsConfigurator!
    var presenter: CurrencyPairsPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator.configure(self)
        self.presenter.viewDidLoad()
    }

}

extension CurrencyPairsViewController: CurrencyPairsView {

}
