//
//  ImageCollectionViewController.swift
//  NASApp
//
//  Created by ASD on 2.03.2021.
//

import UIKit
import Alamofire
import Kingfisher


class ImageCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var page = 1
    var name: String!
    private var options: [String] = []
        
    let cellID = "cellID"
    private var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ImagesCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        fetchSpaceImages(title: name)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease.circle"), style: .done, target: self, action: #selector(tappedFilterButton))
        
        // TODO:- Options to All viewcontrollers
        if self.name == "Curiosity"{
            options = RoverCamera().curiosity
        }else if self.name == "Opportunity"{
            options = RoverCamera().opportunity
        }else{
            options = RoverCamera().spirit
        }
    }
    
    @objc func tappedFilterButton(){
        print("Tapped filter")
        let alert = UIAlertController(title: "Filter by Camera Type", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "All", style: .default, handler: { (_) in
            self.fetchSpaceImages(title: self.name)
        }))
        let closure = { (action: UIAlertAction!) -> Void in
            let index = alert.actions.lastIndex(of: action)

            if index != nil {
                NSLog("Index: \(self.options[index! - 1])")// You can access filter index
                self.fetchSpaceImages(title:self.name, with: self.options[index! - 1])
            }
        }
        
        for i in 0..<options.count{
            alert.addAction(UIAlertAction(title: options[i], style: .default, handler: closure))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    //MARK:- Pagination
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if indexPath.row == photos.count - 1 {
                updateNextSet()
            }
    }

    func updateNextSet(){
        print("On Completetion")
        page = page + 1
        fetchSpaceImages(title: name, page: page)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ImagesCollectionViewCell
            let photoImgUrl = self.photos[indexPath.row].img_src
            let url = URL(string: photoImgUrl)
            cell.photo.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height - 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        //TODO: use delegate and pass data to imagedetailviewController!!!!!!!
        //TODO: tidy below this codes!!!!!!!!
        
        let vc = ImageDetailViewController()
        vc.roverName.text = photo.rover.name
        vc.cameraType.text = photo.camera.name
        vc.photoDate.text = photo.earth_date
        vc.landingDate.text = photo.rover.landing_date
        vc.launchDate.text = photo.rover.launch_date
        vc.roverStatus.text = photo.rover.status
        let url = URL(string: photo.img_src)
        vc.image.kf.setImage(with: url)
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Initializers
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    convenience init(title: String) {
        self.init()
        self.name = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Fetch Networks
    func fetchSpaceImages(title: String, page: Int){
        let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(title.lowercased())/photos?sol=1000&page=\(page)&api_key=KHRJbKdXYnP7bqpiVGHl3u190QVlF07JuqPlJs56"
        let request = AF.request(url)
        request.responseDecodable(of: APIResults.self) { (response) in
            guard let curiosityImages = response.value?.photos else {return}
            if curiosityImages != []{
                self.photos += curiosityImages
                self.collectionView.reloadData()
            }
        }
    }
    
    func fetchSpaceImages(title: String){
        let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(title.lowercased())/photos?sol=1000&page=1&api_key=KHRJbKdXYnP7bqpiVGHl3u190QVlF07JuqPlJs56"
        let request = AF.request(url)
        request.responseDecodable(of: APIResults.self) { (response) in
            guard let curiosityImages = response.value?.photos else {return}
            self.photos = curiosityImages
            self.collectionView.reloadData()
        }
    }
    
    func fetchSpaceImages(title: String, with camera: String){
        let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/\(title)/photos?sol=1000&camera=\(camera.lowercased())&page=1&api_key=KHRJbKdXYnP7bqpiVGHl3u190QVlF07JuqPlJs56"
        let request = AF.request(url)
        request.responseDecodable(of: APIResults.self) { (response) in
            guard let curiosityImages = response.value?.photos else {return}
            self.photos = curiosityImages
            self.collectionView.reloadData()
        }
    }
    
}

