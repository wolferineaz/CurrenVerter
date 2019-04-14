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
    var name: String?
    var used = false

    init(identifier: String, name: String) {
        self.identifier = identifier
        self.name = name
    }

    class func name(by identifier: String) -> String {
        return identifier.localized()
    }

}

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

}

extension Currency {

    static func all() -> [Currency] {
        return self.identifiers().map { Currency(identifier: $0, name: $0.localized()) }
    }

    static func filtered(by currency: Currency?) -> [Currency] {
        guard let currency = currency else { return self.all() }

        let used = CoreData.manager.usedIdentifiers(by: currency)
        return self.identifiers().map {
            let currency = Currency(identifier: $0, name: $0.localized())
            guard let used = used, let identifier = currency.identifier else { return currency }
            currency.used = used.contains(identifier)
            return currency
        }
    }

    static func identifiers() -> [String] {
        return ["AUD", "BGN", "BRL", "CAD", "CHF", "CNY", "CZK", "DKK",
                "EUR", "GBP", "HKD", "HRK", "HUF", "IDR", "ILS", "INR",
                "ISK", "JPY", "KRW", "MXN", "MYR", "NOK", "NZD", "PHP",
                "PLN", "RON", "RUB", "SEK", "SGD", "THB", "USD", "ZAR"]
    }

}
