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

    var data: [CurrencyTableCellData]?

    //MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator.configure(self)
        self.presenter.viewDidLoad()

        self.configureTableView()
    }

    //MARK: - Configuring

    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CurrencyTableCell.nib,
                                forCellReuseIdentifier: CurrencyTableCell.identifier)
    }

}

extension CurrencySelectViewController: CurrencySelectView {

    func show(_ currencies: [Currency]) {
        self.data = currencies.map { (currency) -> CurrencyTableCellData in
            return CurrencyTableCellData(currency)
        }
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

        let currencyData = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableCell.identifier,
                                                 for: indexPath) as! CurrencyTableCell
        cell.bind(currencyData)
        return cell
    }

}

extension CurrencySelectViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let data = self.data {
            let currencyData = data[indexPath.row]

            if currencyData.currencyUsed {
                let cell = tableView.cellForRow(at: indexPath)
                cell?.shake(duration: 0.5)
            } else {
                self.presenter.onSelect(currencyData)
            }
        }
    }

}
