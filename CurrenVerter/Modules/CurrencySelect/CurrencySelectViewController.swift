//
//  CurrencySelectViewController.swift
//  CurrenVerter
//  Module: CurrencySelect
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencySelectView: class {
    func show(_ currencies: [Currency])
}

class CurrencySelectViewController: UIViewController {

    //MARK: - VUPER

    var configurator: CurrencySelectConfigurator!
    var presenter: CurrencySelectPresenter!

    //MARK: - Data

    var data: [Currency]?

    //MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self

        self.configurator.configure(self)
        self.presenter.viewDidLoad()
    }

}

extension CurrencySelectViewController: CurrencySelectView {

    func show(_ currencies: [Currency]) {
        self.data = currencies
        self.tableView.reloadData()
    }

}

extension CurrencySelectViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = self.data else { return 0 }
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = self.data else { return UITableViewCell() }

        let currency = data[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = currency.identifier
        return cell
    }

}
