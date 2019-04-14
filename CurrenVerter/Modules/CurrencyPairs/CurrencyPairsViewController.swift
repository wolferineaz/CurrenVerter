//
//  CurrencyPairsViewController.swift
//  CurrenVerter
//  Module: CurrencyPairs
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit
import CoreData

protocol CurrencyPairsView: class {
    func show(_ pairs: [CurrencyPair])
}

class CurrencyPairsViewController: UIViewController {

    //MARK: - VUPER

    var configurator: CurrencyPairsConfigurator!
    var presenter: CurrencyPairsPresenter!

    //MARK: - Data

    var data: [CurrencyPair]?

    //MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator.configure(self)
        self.presenter.viewDidLoad()
        self.configureTableView()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "clear", style: .plain, target: self, action: #selector(clear))
    }

    @objc func clear() {
        CoreData.manager.clear()
        self.presenter.reloadPairs()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.reloadPairs()
    }

    //MARK: - Configuring

    func configureTableView() {
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedSectionHeaderHeight = 44.0
    }

    //MARK: - Actions

    @objc func onClickAddButton(sender: UIButton) {
        self.presenter.onClickAddNewPair()
    }

}

extension CurrencyPairsViewController: CurrencyPairsView {

    func show(_ pairs: [CurrencyPair]) {
        self.data = pairs

        if pairs.isEmpty {
            self.tableView.showEmptyView(with: self,
                                         selector: #selector(onClickAddButton(sender:)))
        } else {
            self.tableView.hideEmptyView()
        }
        self.tableView.reloadData()
    }

}

extension CurrencyPairsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let data = self.data {
            let pair = data[indexPath.row]
            cell.textLabel?.text = "\(pair.from) -> \(pair.to)"
        }
        return cell
    }

}

extension CurrencyPairsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let hasData = (self.data?.count ?? 0) > 0
        return hasData ? UITableView.automaticDimension : 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hasData = (self.data?.count ?? 0) > 0
        return hasData ? CurrencyPairsAddPairHeaderView.fromNib(onClick: {
            self.presenter.onClickAddNewPair()
        }) : nil
    }

}
