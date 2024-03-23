//
//  TemperatureModel.swift
//  WeatherApp
//
//  Created by Egemen Öngel on 22.03.2024.
//

import Foundation

// MARK: - TemperatureModel

struct TemperatureModel: Identifiable, Codable {
    let id, temperature: Int
    let day, iconPath: String

    enum CodingKeys: String, CodingKey {
        case id, day, iconPath, temperature
    }
}
