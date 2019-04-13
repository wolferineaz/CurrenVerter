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
    func show(_ pairs: [CurrencyPair])
}

class CurrencyPairsViewController: UIViewController {

    //MARK: - VUPER

    var configurator: CurrencyPairsConfigurator!
    var presenter: CurrencyPairsPresenter!

    //MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator.configure(self)
        self.presenter.viewDidLoad()
    }

    //MARK: - Actions

    @objc func onClickAddButton(sender: UIButton) {
        self.presenter.onClickAddNewPair()
    }

}

extension CurrencyPairsViewController: CurrencyPairsView {

    func show(_ pairs: [CurrencyPair]) {
        if pairs.isEmpty {
            self.tableView.showEmptyView(with: self,
                                         selector: #selector(onClickAddButton(sender:)))
        }
    }

}
