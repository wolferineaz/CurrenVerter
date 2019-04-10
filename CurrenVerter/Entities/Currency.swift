//
//  Currency.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import Foundation

class Currency {

    var identifier: String?

    init(identifier: String) {
        self.identifier = identifier
    }

}

extension Currency {

    static func all() -> [Currency] {
        return self.identifiers().map { Currency(identifier: $0) }
    }

    static func identifiers() -> [String] {
        return ["AUD", "BGN", "BRL", "CAD", "CHF", "CNY", "CZK", "DKK",
                "EUR", "GBP", "HKD", "HRK", "HUF", "IDR", "ILS", "INR",
                "ISK", "JPY", "KRW", "MXN", "MYR", "NOK", "NZD", "PHP",
                "PLN", "RON", "RUB", "SEK", "SGD", "THB", "USD", "ZAR"]
    }

}
