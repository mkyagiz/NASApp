//
//  Photo.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 3.03.2021.
//

import Foundation

struct Photo: Decodable, Equatable{
    
    let camera: Camera
    let photoURL: String
    let photoDate: String
    let rover: Rover
    
    private enum CodingKeys: String, CodingKey {
        case camera, photoURL = "img_src", photoDate = "earth_date", rover
    }

}

