//
//  Weather.swift
//  Task14
//
//  Created by eugene on 08/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherObject: Object {
    @objc dynamic var date: Int = Int(Date().timeIntervalSince1970)
    @objc dynamic var temp: Float = 0.0
    @objc dynamic var feels_like: Float = 0.0
    @objc dynamic var city = ""
}
