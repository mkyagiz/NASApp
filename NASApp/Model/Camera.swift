//
//  Camera.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 3.03.2021.
//

import Foundation
struct Camera: Decodable, Equatable {
    let name: String
    let fullName: String
    
    private enum CodingKeys: String, CodingKey {
        case name, fullName = "full_name"
    }
}


