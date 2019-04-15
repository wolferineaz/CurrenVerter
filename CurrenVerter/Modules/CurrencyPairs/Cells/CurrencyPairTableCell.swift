//
//  CurrencyPairTableCell.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 14/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

class CurrencyPairTableCellData {

    var from: String
    var to: String
    var value: Double

    init(_ pair: PairResponse) {
        self.from = pair.from ?? ""
        self.to = pair.to ?? ""
        self.value = pair.value ?? 0
    }
}

class CurrencyPairTableCell: UITableViewCell {

    var data: CurrencyPairTableCellData!

    @IBOutlet weak var fromTopLabel: UILabel!
    @IBOutlet weak var fromBottomLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var toBottomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bind(_ data: CurrencyPairTableCellData) {
        self.data = data

        self.fromTopLabel.text = "1 \(self.data.from)"
        self.fromBottomLabel.text = Currency.name(by: self.data.from)
        self.resultLabel.text = "\(self.data.value)"
        self.toBottomLabel.text = Currency.name(by: self.data.to) + " • " + self.data.to
    }
}
