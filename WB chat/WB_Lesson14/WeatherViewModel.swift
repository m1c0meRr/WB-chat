//
//  WeatherViewModel.swift
//  WB_Lesson14
//
//  Created by Sergey Savinkov on 23.07.2024.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    private let weatherAPIClient: WeatherAPIClient
    private let weatherNotifier: WeatherNotifier

    init(weatherAPIClient: WeatherAPIClient = WeatherAPIClient.sharedInstance, weatherNotifier: WeatherNotifier = WeatherNotifier()) {
        self.weatherAPIClient = weatherAPIClient
        self.weatherNotifier = weatherNotifier
        weatherNotifier.addObserver(self)
    }

    func fetchWeather(for city: String) {
        weatherAPIClient.fetchWeather(for: city) { [weak self] weatherData in
            self?.weatherData = weatherData
            self?.weatherNotifier.notifyObservers(with: weatherData)
        }
    }
}

extension WeatherViewModel: WeatherObserver {
    func didUpdateWeather(_ weatherData: WeatherData) {
        self.weatherData = weatherData
    }
}
