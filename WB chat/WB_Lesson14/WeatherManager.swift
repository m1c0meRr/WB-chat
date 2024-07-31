//
//  WeatherManager.swift
//  WB_Lesson14
//
//  Created by Sergey Savinkov on 23.07.2024.
//

import Foundation

protocol WeatherObserver: AnyObject {
    func didUpdateWeather(_ weatherData: WeatherData)
}

class WeatherNotifier {
    private var observers: [WeatherObserver] = []

    func addObserver(_ observer: WeatherObserver) {
        observers.append(observer)
    }

    func removeObserver(_ observer: WeatherObserver) {
        observers.removeAll(where: { $0 === observer })
    }

    func notifyObservers(with weatherData: WeatherData) {
        observers.forEach { $0.didUpdateWeather(weatherData) }
    }
}
