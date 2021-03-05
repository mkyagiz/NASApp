//
//  Photo.swift
//  NASApp
//
//  Created by ASD on 3.03.2021.
//

import Foundation

struct Photo: Decodable, Equatable{
    let camera: Camera
    let img_src: String
    let earth_date: String
    let rover: Rover
}
