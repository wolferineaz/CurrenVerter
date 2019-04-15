//
//  CurrencyPairsPresenter.swift
//  CurrenVerter
//  Module: CurrencyPairs
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

protocol CurrencyPairsPresenter {
    func onViewDidLoad()
    func onViewWillDisappear()
    func onViewWillAppear()
    func reloadPairs()
    func onClickAddNewPair()
}

class CurrencyPairsPresenterImpl: CurrencyPairsPresenter {
    fileprivate weak var view: CurrencyPairsView?
    fileprivate let router: CurrencyPairsRouter

    var lastTask: URLSessionTask?

    var timer: Timer!

    func onViewDidLoad() {

    }

    func onViewWillAppear() {
        guard let pairs = CoreData.manager.pairs() else { return }
        Network.manager.load(pairs, block: { (results) in
            guard let data = results else { return }

            self.view?.show(data)
        })
    }

    func onViewWillDisappear() {
        self.timer.invalidate()
    }

    func reloadPairs() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            guard let pairs = CoreData.manager.pairs() else { return }

            if self.lastTask != nil {
                return
            }

            self.lastTask = Network.manager.load(pairs, block: { (results) in
                guard let data = results else { return }

                self.view?.update(data)

                self.lastTask = nil
            })


        })
    }

    func onClickAddNewPair() {
        self.router.showCurrencies()
    }

    init(view: CurrencyPairsView, router: CurrencyPairsRouter) {
        self.view = view
        self.router = router
    }

}
