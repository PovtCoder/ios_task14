//
//  WeatherService.swift
//  Task14
//
//  Created by eugene on 08/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherService {
    var realm: Realm
    
    static var shared: WeatherService = {
        let instance = WeatherService()
         
        return instance
    }()
    
    private init() {
        try! realm = Realm()
    }
    
    func findAll() -> Results<WeatherObject> {
        realm.objects(WeatherObject.self)
    }
    
    func save(weather: WeatherObject) {
        try! realm.write {
            realm.add(weather)
        }
    }
}
