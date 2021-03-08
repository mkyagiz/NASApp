//
//  NASAppTests.swift
//  NASAppTests
//
//  Created by M.Kasim Yagiz on 5.03.2021.
//

import XCTest
@testable import NASApp
class NASAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPhotoViewModel(){
        //Given:
        let photo = Photo(camera: Camera(name: "MAST", fullName: "Mast Camera"), photoURL: "http://mars.jpl.nasa.gov/msl-raw-images/msss/01000/mcam/1000ML0044631050305202E01_DXXX.jpg", photoDate: "2015-05-30", rover: Rover(name: "Curiosity", landingDate: "2012-08-06", launchDate: "2011-11-26", status: "active"))
        //When:
        let photoViewModel = PhotoViewModel(photo: photo)
        //Then:
        XCTAssertEqual(photo.camera.name, photoViewModel.cameraType)
        XCTAssertEqual(photo.camera.fullName, photoViewModel.cameraTypeFullName)
        XCTAssertEqual(photo.photoURL, photoViewModel.photoURL)
        XCTAssertEqual(photo.photoDate, photoViewModel.photoDate)
        XCTAssertEqual(photo.rover.name, photoViewModel.roverName)
        XCTAssertEqual(photo.rover.status, photoViewModel.roverStatus)
        XCTAssertEqual(photo.rover.launchDate, photoViewModel.launchDate)
        XCTAssertEqual(photo.rover.landingDate, photoViewModel.landingDate)
    }
    
    func testCameraType(){
        //Given
        let roverCameraTypes = RoverCamera()
        //When
        XCTAssertEqual(roverCameraTypes.curiosity ,["FHAZ", "RHAZ", "MAST", "CHEMCAM", "MAHLI", "MARDI", "NAVCAM"])
        XCTAssertEqual(roverCameraTypes.opportunity, ["FHAZ", "RHAZ", "NAVCAM", "PANCAM", "MINITES"])
        XCTAssertEqual(roverCameraTypes.spirit, ["FHAZ", "RHAZ", "NAVCAM", "PANCAM", "MINITES"])
    }
    
}
