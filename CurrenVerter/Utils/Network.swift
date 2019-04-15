//
//  Network.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 14/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import Foundation

typealias NetworkCurrencyPairsBlock = ([PairResponse]?) -> Void

class Network {

    static var baseUrl = "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios"
    static var manager = Network()

    @discardableResult
    func load(_ pairs: [CurrencyPair], block: @escaping NetworkCurrencyPairsBlock) -> URLSessionTask {

        let components = NSURLComponents(string: Network.baseUrl)!
        pairs.forEach { (pair) in
            components.appendQueryItem(with: "pairs", value: "\(pair.from!)\(pair.to!)")
        }
        let session = URLSession.shared
        let request = URLRequest(url: components.url!)
        let task = session.dataTask(with: request as URLRequest,
                                    completionHandler: { data, response, error in
            guard error == nil else {
                return
            }

            guard let data = data else {
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Double] {

                    let result = json.map({ (key, value) in
                        return PairResponse(with: key, value: value)
                    })

                    block(result)

                }
            } catch let error {
                print(error.localizedDescription)
                block(nil)
            }
        })

        task.resume()
        return task
    }

}

extension NSURLComponents {

    func appendQueryItem(with name: String, value: String) {
        var queryItems: [URLQueryItem] = self.queryItems ?? [URLQueryItem]()
        queryItems.append(URLQueryItem(name: name, value: value))
        self.queryItems = queryItems
    }

}
