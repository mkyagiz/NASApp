//
//  Rover.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 3.03.2021.
//

import Foundation
struct Rover: Decodable, Equatable{
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}


