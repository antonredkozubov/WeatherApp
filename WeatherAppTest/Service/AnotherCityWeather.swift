//
//  AnotherCityWeather.swift
//  WeatherAppTest
//
//  Created by Anton Redkozubov on 24.06.2021.
//

import Foundation

class AnotherCityWeather {

    var weatherData = WeatherData()

    func updateInAnotherCityWeather(in city: String) {
            let session = URLSession.shared
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)")!
            let task = session.dataTask(with: url) { data, _, error in
                if let data = data {
                    let dataString = String(data: data, encoding: .utf8)
                    print(dataString)
                }
            }
            task.resume()
    }
}
