//
//  WeatherView.swift
//  WB_Lesson14
//
//  Created by Sergey Savinkov on 23.07.2024.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack {
            Text(viewModel.weatherData?.city ?? "")
                .font(.title)
            Text(viewModel.weatherData?.temperatureString ?? "")
                .font(.subheadline)
            Button("Fetch Weather") {
                viewModel.fetchWeather(for: "London")
            }
        }
    }
}

#Preview {
    WeatherView()
}
