//
//  Rover.swift
//  NASApp
//
//  Created by ASD on 3.03.2021.
//

import Foundation
struct Rover: Decodable, Equatable{
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
}
