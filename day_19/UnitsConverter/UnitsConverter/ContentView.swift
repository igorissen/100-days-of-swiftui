//
//  ContentView.swift
//  UnitsConverter
//
//  Created by Ismael Gorissen on 07/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedConversionType = "Length"
    @State private var fromUnit: Dimension = UnitLength.baseUnit()
    @State private var toUnit: Dimension = UnitLength.baseUnit()
    @State private var fromValue: Double = 0
    
    @FocusState private var isFocused: Bool
    
    private let conversionTypes = ["Length", "Temperature", "Time", "Volume"]
    private let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    private let temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    private let timeUnits: [UnitDuration] = [.seconds, .minutes, .hours]
    private let volumeUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    var units: [String: [Dimension]] {
        [
            "Length": lengthUnits,
            "Temperature": temperatureUnits,
            "Time": timeUnits,
            "Volume": volumeUnits
        ]
    }
    
    var convertedValue: Double {
        Measurement(value: fromValue, unit: fromUnit).converted(to: toUnit).value
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Choose a conversion type") {
                    Picker("Type", selection: $selectedConversionType) {
                        ForEach(conversionTypes, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .onChange(of: selectedConversionType) {
                        fromUnit = (units[selectedConversionType] ?? [])[0]
                        toUnit = (units[selectedConversionType] ?? [])[0]
                    }
                }
                
                Section("Value to convert") {
                    TextField("Input unit value", value: $fromValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                
                Section("Input unit") {
                    Picker("From", selection: $fromUnit) {
                        ForEach(units[selectedConversionType] ?? [], id: \.self) {
                            Text("\($0.symbol)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output unit") {
                    Picker("To", selection: $toUnit) {
                        ForEach(units[selectedConversionType] ?? [], id: \.self) {
                            Text("\($0.symbol)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    Text("\(Measurement(value: fromValue, unit: fromUnit).formatted()) = \(Measurement(value: convertedValue, unit: toUnit).formatted())")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
