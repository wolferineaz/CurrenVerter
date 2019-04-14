//
//  CurrencyTableCell.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

class CurrencyTableCellData {
    var currencyIdentifier: String
    var currencyName: String
    var currencyUsed: Bool

    init(_ currency: Currency) {
        self.currencyIdentifier = currency.identifier ?? ""
        self.currencyName = currency.name ?? ""
        self.currencyUsed = currency.used
    }
}

class CurrencyTableCell: UITableViewCell {

    var data: CurrencyTableCellData!

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func bind(_ data: CurrencyTableCellData) {
        self.data = data

        let icon = UIImage(named: "ic_currency_\(self.data.currencyIdentifier.lowercased())")!
        self.iconView.image = icon
        self.iconView.layer.cornerRadius = self.iconView.frame.width / 2.0

        self.shortNameLabel.text = self.data.currencyIdentifier

        self.fullNameLabel.text = self.data.currencyName

        self.contentView.alpha = self.data.currencyUsed ? 0.4 : 1.0
    }
    
}
