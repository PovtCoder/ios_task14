//
//  Weather.swift
//  Test12
//
//  Created by eugene on 09/03/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import Foundation

class Weather: Codable {
    var dt: Int = 0
    var main: Main?
    
    init() {}
}

class City: Codable {
    var name: String = ""
    
    init() {}
}

class Main: Codable {
    var temp: Float = 0.0
    var feels_like: Float = 0.0
    
    init() {}
}

class WeatherForecast: Codable {
    var list: [Weather] = []
    var city: City?
    
    init() {}
}
