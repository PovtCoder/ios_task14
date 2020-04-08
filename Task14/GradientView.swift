//
//  GradientView.swift
//  Test12
//
//  Created by eugene on 09/03/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    @IBInspectable
    var topColor: UIColor = UIColor.clear
    
    @IBInspectable
    var bottomColor: UIColor = UIColor.clear
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let gradient = CAGradientLayer()
        
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        
        layer.insertSublayer(gradient, at: 0)
    }
}
