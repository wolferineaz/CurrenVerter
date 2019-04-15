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
    func show(_ pairs: [PairResponse])
    func update(_ pairs: [PairResponse])
}

class CurrencyPairsViewController: UIViewController {

    //MARK: - VUPER

    var configurator: CurrencyPairsConfigurator!
    var presenter: CurrencyPairsPresenter!

    //MARK: - Data

    var data = [CurrencyPairTableCellData]()

    //MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "dashboard".localized()
        self.configurator.configure(self)
        self.presenter.onViewDidLoad()
        self.configureTableView()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "clear", style: .plain, target: self, action: #selector(clear))
    }

    @objc func clear() {
        CoreData.manager.clear()
        self.presenter.onViewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.reloadPairs()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.presenter.onViewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.presenter.onViewWillDisappear()
    }

    //MARK: - Configuring

    func configureTableView() {
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedSectionHeaderHeight = 44.0
        self.tableView.register(CurrencyPairTableCell.nib,
                                forCellReuseIdentifier: CurrencyPairTableCell.identifier)
    }

    //MARK: - Actions

    @objc func onClickAddButton(sender: UIButton) {
        self.presenter.onClickAddNewPair()
    }

}

extension CurrencyPairsViewController: CurrencyPairsView {

    func show(_ pairs: [PairResponse]) {

        DispatchQueue.main.async {

            if pairs.isEmpty {
                self.data.removeAll()
                self.tableView.reloadData()
                self.tableView.showEmptyView(with: self,
                                             selector: #selector(self.onClickAddButton(sender:)))
            } else {
                self.tableView.hideEmptyView()
                self.data = pairs.map({ (data) -> CurrencyPairTableCellData in
                    return CurrencyPairTableCellData(data)
                })
                self.tableView.reloadData()
            }
            
        }

    }

    func update(_ pairs: [PairResponse]) {
        DispatchQueue.main.async {
            self.data = pairs.map({ (data) -> CurrencyPairTableCellData in
                return CurrencyPairTableCellData(data)
            })

            guard let indexPaths = self.tableView.indexPathsForVisibleRows else { return }

            indexPaths.forEach({ (indexPath) in
                if let cell = self.tableView.cellForRow(at: indexPath) as? CurrencyPairTableCell {
                    cell.bind(self.data[indexPath.row])
                }
            })
        }
    }

}

extension CurrencyPairsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CurrencyPairTableCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CurrencyPairTableCell
        let data = self.data[indexPath.row]
        cell?.bind(data)
        return cell!
    }

}

extension CurrencyPairsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let hasData = self.data.count > 0
        return hasData ? UITableView.automaticDimension : 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hasData = self.data.count > 0
        return hasData ? CurrencyPairsAddPairHeaderView.fromNib(onClick: {
            self.presenter.onClickAddNewPair()
        }) : nil
    }

}
