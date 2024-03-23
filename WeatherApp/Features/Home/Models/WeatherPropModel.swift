//
//  WeatherPropModel.swift
//  WeatherApp
//
//  Created by Egemen Öngel on 22.03.2024.
//

import Foundation

// MARK: - WeatherPropModel

struct WeatherPropModel: Identifiable, Codable {
    let id: Int
    let name, iconPath, value: String

    enum CodingKeys: String, CodingKey {
        case id, name, iconPath, value
    }
}
