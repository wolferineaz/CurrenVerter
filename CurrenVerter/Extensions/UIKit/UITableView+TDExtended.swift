//
//  UITableView+TDExtended.swift
//  CurrenVerter
//
//  Created by Tabriz Dzhavadov on 11/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

extension UITableView {

    func hideEmptyView() {
        self.backgroundView = UIView()
    }

    func showEmptyView(with target: Any, selector: Selector) {
        let contentView = self.contentView()
        let button = self.button(with: target, and: selector)
        let label = self.label()
        let imageView = self.imageView()
        contentView.addSubview(button)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        self.configure(button, in: contentView)
        self.configure(label, in: contentView, under: button)
        self.configure(imageView, in: contentView, upper: button)

        contentView.layoutIfNeeded()
        self.backgroundView = contentView
        self.separatorStyle = .none
    }
    
    func contentView() -> UIView {
        let rect = CGRect(origin: CGPoint.zero, size: self.bounds.size)
        return UIView(frame: rect)
    }

    func button(with target: Any, and selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("add_pair_title".localized(), for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        return button
    }

    func configure(_ button: UIButton, in superView: UIView) {
        button.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20).isActive = true
    }

    func label() -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "add_pair_desc".localized()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }

    func configure(_ label: UILabel, in superView: UIView, under button: UIButton) {
        label.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20).isActive = true
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10).isActive = true
    }

    func imageView() -> UIImageView {
        let imageView = UIImageView.init(image: UIImage(named: "ic_plus"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func configure(_ imageView: UIImageView, in superView: UIView, upper button: UIButton) {
        imageView.leadingAnchor.constraint(greaterThanOrEqualTo: superView.leadingAnchor, constant: 20).isActive = true
        superView.trailingAnchor.constraint(greaterThanOrEqualTo: imageView.trailingAnchor, constant: 20).isActive = true
        imageView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 64.0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64.0).isActive = true
    }

}
