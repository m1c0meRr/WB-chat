//
//  DatePickerView.swift
//  WB chat
//
//  Created by Sergey Savinkov on 23.06.2024.
//

import SwiftUI

struct DatePickerView: View {
    @State private var datePickerValue = Date()
    @State private var selectedLocale = Locale.current
    
    var dateStyle = DateFormatter.Style.full
    let flags: [String] = ["🇺🇸", "🇫🇷", "🇩🇪", "🇪🇸", "🇮🇹"]
    let locales: [Locale] = [
        Locale(identifier: "en_US"),
        Locale(identifier: "fr_FR"),
        Locale(identifier: "de_DE"),
        Locale(identifier: "es_ES"),
        Locale(identifier: "it_IT")
    ]
    
    var body: some View {
        VStack {
            Text("Выбирите дату:")
                .font(.title)
                .padding(24)
            
            DatePicker("Select a date", selection: $datePickerValue)
                .labelsHidden()
            
            Picker("Choose a language", selection:$selectedLocale) {
                ForEach(0..<locales.count, id: \.self) { i in
                    Text(self.flags[i]).tag(self.locales[i])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            let dates = getFormattedDate(from: datePickerValue)
            
            List {
                ForEach(dates, id: \.self) { dateText in
                    Text(dateText)
                        .font(dateText.contains("Today") ? .subheadline.bold() : .subheadline)
                }
            }
            .listStyle(.plain)
            .font(.subheadline)
            .padding()
        }
    }
    
    private func getFormattedDate(from date: Date) -> [String] {
        let calendar = Calendar.current
        let dayOffsets = [-2,-1,0,1,2]
        let dayNames = ["Day before yesterday", "Yesterday", "Today", "Tomorrow", "Day after tomorrow"]
        
        return dayOffsets.enumerated().map { index, offset in
            let newDate = calendar.date(byAdding: .day, value: offset, to: date)!
            return "\(dayNames[index]): \(newDate, locale: selectedLocale, style: dateStyle)"
        }
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ date: Date, locale: Locale, style: DateFormatter.Style) {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = style
        let formatterDate = formatter.string(from: date)
        appendLiteral(formatterDate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
