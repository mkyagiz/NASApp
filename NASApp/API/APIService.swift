//
//  APIService.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 5.03.2021.
//

import Foundation
import Alamofire

class APIService{
    private static let basePhotoURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
    private static let apiKey = "KHRJbKdXYnP7bqpiVGHl3u190QVlF07JuqPlJs56"
    
    //singleton
    static let shared = APIService()
    
    func fetchSpaceImages(title: String, page: Int, completion: @escaping ([Photo]) -> ()){
        let url = APIService.basePhotoURL+"\(title.lowercased())/photos?sol=1000&page=\(page)&api_key="+APIService.apiKey
        let request = AF.request(url)
        request.responseDecodable(of: APIResults.self) {(response) in
            guard let spaceImages = response.value?.photos else {return}
            if spaceImages != []{
                completion(spaceImages)

            }
        }
    }
    
    func fetchSpaceImages(title: String, completion: @escaping([Photo]) -> ()){
        let url = APIService.basePhotoURL+"\(title.lowercased())/photos?sol=1000&page=1&api_key="+APIService.apiKey
        let request = AF.request(url)
        request.responseDecodable(of: APIResults.self) { (response) in
            guard let spaceImages = response.value?.photos else {return}
            completion(spaceImages)

        }
    }
    
    func fetchSpaceImages(title: String, with camera: String, completion: @escaping([Photo]) -> ()){
        let url = APIService.basePhotoURL+"\(title)/photos?sol=1000&camera=\(camera.lowercased())&page=1&api_key="+APIService.apiKey
        let request = AF.request(url)
        request.responseDecodable(of: APIResults.self) { (response) in
            guard let spaceImages = response.value?.photos else {return}
            completion(spaceImages)
        }
    }
}
