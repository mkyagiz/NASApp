//
//  PhotoViewModel.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 5.03.2021.
//

import Foundation
struct PhotoViewModel{
    
    let roverName: String
    let cameraType: String
    let cameraTypeFullName: String
    let photoDate: String
    let landingDate: String
    let launchDate: String
    let roverStatus: String
    let photoURL: String
    
    init(photo: Photo) {
        self.roverName = photo.rover.name
        self.cameraType = photo.camera.name
        self.cameraTypeFullName = photo.camera.fullName
        self.photoDate = photo.photoDate
        self.landingDate = photo.rover.landingDate
        self.launchDate = photo.rover.launchDate
        self.roverStatus = photo.rover.status
        self.photoURL = photo.photoURL
    }
}
