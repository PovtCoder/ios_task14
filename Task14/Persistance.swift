//
//  Persistance.swift
//  Task14
//
//  Created by eugene on 07/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import Foundation

class Persistance {
    static let shared = Persistance()
    
    private let firstNameKey = "Persistance.firstname"
    private let secondNameKey = "Persistance.secondname"
    
    var firstName: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: firstNameKey)
        }
        get {
            return UserDefaults.standard.string(forKey: firstNameKey)
        }
    }
    
    var secondName: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: secondNameKey)
        }
        get {
            return UserDefaults.standard.string(forKey: secondNameKey)
        }
    }
}
