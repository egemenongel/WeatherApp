//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Egemen Öngel on 23.02.2024.
//

import Foundation

// MARK: - WeatherModel

struct WeatherModel: Identifiable, Codable {
    let id, temperature: Int
    let date, location: String

    enum CodingKeys: String, CodingKey {
        case id, date, temperature, location
    }
}
