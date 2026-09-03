//
//  ContentView.swift
//  MultiConverter
//
//  Created by Abdurahman on 2.09.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0.0
    @State private var selectedInputUnitForLegth = "kilometers"
    @State private var selectedOutputUnitForLegth = "meters"
    
    @State private var selectedInputUnitForTemp = "Celsius"
    @State private var selectedOutputUnitForTemp = "Fahrenheit"
    
    @State private var selectedInputUnitForTime = "minutes"
    @State private var selectedOutputUnitForTime = "seconds"
    
    @State private var selectedInputUnitForVolume = "milliliters"
    @State private var selectedOutputUnitForVolume = "liters"
    
    @State private var selectedConverter = "Length"
    
    let lengthUnits = ["meters", "kilometers", "feet", "yard", "miles"]
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let timeUnits = ["minutes", "seconds", "hours", "days"]
    let volumeUnits = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    let converter = ["Length", "Temperature", "Time", "Volume"]
    
    
    func convertLength(value: Double, from: String, to: String) -> String {
        let toMeters: [String: Double] = [
            "meters": 1.0,
            "kilometers": 1000.0,
            "feet": 0.3048,
            "yard": 0.9144,
            "miles": 1609.34
        ]
        
        guard let fromFactor = toMeters[from], let toFactor = toMeters[to] else {
            return "Invalid unit"
        }
        
        let valueInMeters = value * fromFactor
        let result = valueInMeters / toFactor
        
        return String(format: "%.2f", result)
    }
    
    func convertTime(value: Double, from: String, to: String) -> String {
        let toSeconds: [String: Double] = [
            "seconds": 1.0,
            "minutes": 60.0,
            "hours": 3600.0,
            "days": 86400.0,
        ]
        guard let fromFactor = toSeconds[from], let toFactor = toSeconds[to] else {
            return "Invalid unit"
        }
        let result = (value * fromFactor) / toFactor
        return String(format: "%.2f", result)
    }
    
    func convertTemperature(value: Double, from: String, to: String) -> String {
        var celsius: Double
        switch from {
        case "Celsius":
            celsius = value
        case "Fahrenheit":
            celsius = (value - 32) * 5 / 9
        case "Kelvin":
            celsius = value - 273.15
        default:
            return "Invalid unit"
        }
        
        var result: Double
        switch to {
        case "Celsius":
            result = celsius
        case "Fahrenheit":
            result = celsius * 9 / 5 + 32
        case "Kelvin":
            result = celsius + 273.15
        default:
            return "Geçersiz birim"
        }
        
        return String(format: "%.2f", result)
    }
    
    func convertVolume(value: Double, from: String, to: String) -> String {
        let toLiters: [String: Double] = [
            "liters": 1.0,
            "milliliters": 0.001,
            "gallons": 3.78541,
            "cups": 0.236588,
            "pints": 0.473176
        ]
        guard let fromFactor = toLiters[from], let toFactor = toLiters[to] else {
            return "Geçersiz birim"
        }
        let result = (value * fromFactor) / toFactor
        return String(format: "%.2f", result)
    }
    
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Amount to Convert"){
                    TextField("Input unit", value: $inputUnit, format: .number)
                }
                if selectedConverter == "Length" {Section("Input Type"){
                    Picker("Unit", selection: $selectedInputUnitForLegth) {
                        ForEach(lengthUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                    .pickerStyle(.segmented)
                }
                if selectedConverter == "Length" {Section("Output Type"){
                    Picker("Unit", selection: $selectedOutputUnitForLegth) {
                        ForEach(lengthUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                .pickerStyle(.segmented)
                }
                if selectedConverter == "Length" {Section("Output"){
                    Text(convertLength(value: inputUnit, from: selectedInputUnitForLegth, to: selectedOutputUnitForLegth))
                }
                }
                if selectedConverter == "Temperature" {Section("Input Type"){
                    Picker("Unit", selection: $selectedInputUnitForTemp) {
                        ForEach(temperatureUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                    .pickerStyle(.segmented)
                }
                if selectedConverter == "Temperature" {Section("Output Type"){
                    Picker("Unit", selection: $selectedOutputUnitForTemp) {
                        ForEach(temperatureUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                .pickerStyle(.segmented)
                }
                if selectedConverter == "Temperature" {Section("Output"){
                    Text(convertTemperature(value: inputUnit, from: selectedInputUnitForTemp, to: selectedOutputUnitForTemp))
                }
                }
                if selectedConverter == "Time" {Section("Input Type"){
                    Picker("Unit", selection: $selectedInputUnitForTime) {
                        ForEach(timeUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                    .pickerStyle(.segmented)
                }
                if selectedConverter == "Time" {Section("Output Type"){
                    Picker("Unit", selection: $selectedOutputUnitForTime) {
                        ForEach(timeUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                .pickerStyle(.segmented)
                }
                if selectedConverter == "Time" {Section("Output"){
                    Text(convertTime(value: inputUnit, from: selectedInputUnitForTime, to: selectedOutputUnitForTime))
                }
                }
                if selectedConverter == "Volume" {Section("Input Type"){
                    Picker("Unit", selection: $selectedInputUnitForVolume) {
                        ForEach(volumeUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                    .pickerStyle(.segmented)
                }
                if selectedConverter == "Volume" {Section("Output Type"){
                    Picker("Unit", selection: $selectedOutputUnitForVolume) {
                        ForEach(volumeUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                .pickerStyle(.segmented)
                }
                if selectedConverter == "Volume" {Section("Output"){
                    Text(convertVolume(value: inputUnit, from: selectedInputUnitForVolume, to: selectedOutputUnitForVolume))
                }
                }
                Section("Converter"){
                    Picker("Unit", selection: $selectedConverter) {
                        ForEach(converter, id: \.self) { type in
                                    Text(type)
                                }
                        }
                    }
                .pickerStyle(.wheel)
                }
            }
            .navigationTitle("Multi Converter")
        }
    }


#Preview {
    ContentView()
}
