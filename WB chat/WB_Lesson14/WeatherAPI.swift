//
//  WeatherAPI.swift
//  WB_Lesson14
//
//  Created by Sergey Savinkov on 23.07.2024.
//

import Foundation

class WeatherAPIClient {
    static let sharedInstance = WeatherAPIClient()
    private let apiUrl = "https://api.openweathermap.org/data/2.5/weather"

    private init() {}

    func fetchWeather(for city: String, completion: @escaping (WeatherData) -> Void) {
        completion(WeatherData(city: city, temperature: 25.0, condition: "Sunny"))
    }
}
