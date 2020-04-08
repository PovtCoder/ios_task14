//
//  WeatherLoader.swift
//  Test12
//
//  Created by eugene on 21/03/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import Foundation

class WeatherLoader {
    
    func loadForecast(completition: @escaping (WeatherForecast) -> Void) {
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/forecast?q=moscow&units=metric&appid=c17799b133f02218fde226fba2d8afe6") {
            
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let res = try JSONDecoder().decode(WeatherForecast.self, from: data)
                        
                        DispatchQueue.main.async {
                            completition(res)
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
