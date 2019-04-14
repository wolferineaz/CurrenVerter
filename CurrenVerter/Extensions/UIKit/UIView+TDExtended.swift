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

    func shake(duration: CFTimeInterval) {
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        translation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        translation.values = [-5, 5, -5, 5, -3, 3, -2, 2, 0]

        let shakeGroup: CAAnimationGroup = CAAnimationGroup()
        shakeGroup.animations = [translation]
        shakeGroup.duration = duration
        self.layer.add(shakeGroup, forKey: "shakeIt")
    }

}
