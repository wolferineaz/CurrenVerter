//
//  CurrencyPair.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import Foundation

class CurrencyPair {

    var from: Currency
    var to: Currency

    init(from: Currency, to: Currency) {
        self.from = from
        self.to = to
    }

}

extension CurrencyPair: CustomStringConvertible {

    var description: String {
        let from = String(describing: self.from.identifier)
        let to = String(describing: self.to.identifier)
        return "(\(from) -> (\(to)))"
    }

}
