//
//  WeatherData.swift
//  WeatherAppTest
//
//  Created by Anton Redkozubov on 18.06.2021.
//

import Foundation

struct WeatherData: Codable {
    var weather: [Weather] = []
    var main: Main = Main()
    var name: String = ""
}

struct Main: Codable {
    var temp: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
