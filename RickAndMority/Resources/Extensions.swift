//
//  Extensions.swift
//  RickAndMority
//
//  Created by Shane Schilling on 7/5/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
