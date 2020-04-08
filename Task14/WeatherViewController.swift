//
//  WeatherViewController.swift
//  Task14
//
//  Created by eugene on 08/04/2020.
//  Copyright © 2020 eugene. All rights reserved.
//

import UIKit
import RealmSwift

class WeatherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var hoursBackgroundView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var weatherForecast: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hoursBackgroundView.layer.shadowColor = UIColor.black.cgColor
        hoursBackgroundView.layer.shadowOpacity = 0.2
        hoursBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 20)
        hoursBackgroundView.layer.shadowRadius = 20
        
        loadWeatherFromDb()
        
        WeatherLoader().loadForecast { weatherList in
            
            for weather in weatherList.list {
                let weatherObject = WeatherObject()
                weatherObject.city = weatherList.city!.name
                weatherObject.date = weather.dt
                weatherObject.temp = weather.main!.temp
                weatherObject.feels_like = weather.main!.feels_like
                
                
                WeatherService.shared.save(weather: weatherObject)
            }
            
            self.updateData(weatherList: weatherList)
        }
    }
    
    func updateData(weatherList: WeatherForecast) {
        let todayWeather = weatherList.list[0]
        
        self.cityLabel.text = weatherList.city?.name
        self.dateLabel.text = todayWeather.dt.timestampToString(format: "MMM dd, yyyy")
        self.tempLabel.text = String(Int(round(todayWeather.main!.temp))) + "º"
        self.feelLikeLabel.text = String(Int(round(todayWeather.main!.feels_like))) + "º"
        
        self.weatherForecast = weatherList.list
        
        self.collectionView.reloadData()
    }
    
    func loadWeatherFromDb() {
        let weather: Results<WeatherObject> = WeatherService.shared.findAll()
        
        let weath = WeatherForecast()
        weath.list = []
        
        for w in weather {
            let ww = Weather()
            ww.dt = w.date
            
            let main = Main()
            main.temp = w.temp
            main.feels_like = w.feels_like
            
            ww.main = main
            
            weath.list.append(ww)
        }
        
        let city = City()
        city.name = weather[0].city
        
        weath.city = city
        
        updateData(weatherList: weath)
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherForecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 60, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourCell", for: indexPath) as! HourCollectionViewCell
        
        cell.hourLabel.text = weatherForecast[indexPath.row].dt.timestampToString(format: "dd.MM HH:mm")
        cell.tempLabel.text = String(Int(round(weatherForecast[indexPath.row].main!.temp))) + "º"
        
        return cell
    }
}
