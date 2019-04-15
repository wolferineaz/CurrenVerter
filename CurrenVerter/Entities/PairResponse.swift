//
//  PairResponse.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 14/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import Foundation

class PairResponse {

    var identifier: String?
    var from: String?
    var to: String?
    var value: Double?

    init(with identifier: String, value: Double) {
        let index = identifier.index(identifier.startIndex, offsetBy: Constants.kCurrencyLength)

        self.identifier = identifier
        self.from = String(identifier[..<index])
        self.to = String(identifier[index...])
        self.value = value
    }
    
}
