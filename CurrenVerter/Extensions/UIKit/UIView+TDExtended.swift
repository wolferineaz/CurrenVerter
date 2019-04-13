//
//  UIView+TDExtended.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 13/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

extension UIView {

    class var identifier: String {
        return String.init(describing: self)
    }

    class var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}
