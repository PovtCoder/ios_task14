//
//  ViewController.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

@IBDesignable
extension UIView {
    @IBInspectable
    var corderRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return self.corderRadius
        }
    }
}

extension Int {
    func timestampToString(format: String) -> String {
        let newTime = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: newTime)
    }
}

extension Date {
    var ignoringTime: Date? {
        let dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: self)
        return Calendar.current.date(from: dateComponents)
    }
}
