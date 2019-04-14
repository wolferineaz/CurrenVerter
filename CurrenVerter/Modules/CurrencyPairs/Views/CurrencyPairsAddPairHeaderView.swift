//
//  CurrencyPairsAddPairHeaderView.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 14/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

typealias CPAddPairHeaderBlock = () -> Void

class CurrencyPairsAddPairHeaderView: UIView {

    var block: CPAddPairHeaderBlock?

    class func fromNib(onClick closure: @escaping CPAddPairHeaderBlock) -> CurrencyPairsAddPairHeaderView? {
        let view = Bundle.main.loadNibNamed(CurrencyPairsAddPairHeaderView.identifier,
                                            owner: self,
                                            options: nil)?.first as? CurrencyPairsAddPairHeaderView
        view?.block = closure
        return view
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onClick))
        self.addGestureRecognizer(recognizer)
    }

    @objc func onClick() {
        guard let block = self.block else { return }

        block()
    }

}
