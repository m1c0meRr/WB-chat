//
//  WeatherData.swift
//  WB_Lesson14
//
//  Created by Sergey Savinkov on 23.07.2024.
//

import Foundation

struct WeatherData {
    let city: String
    let temperature: Double
    let condition: String

    var temperatureString: String {
        return "\(temperature)°C"
    }
}
