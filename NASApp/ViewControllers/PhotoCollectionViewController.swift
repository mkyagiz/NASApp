//
//  PhotoCollectionViewController.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 2.03.2021.
//

import UIKit
import Kingfisher

class PhotoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var page = 1
    private var isPaginating = false
    private var isPaginatingDone = false
    var name: String!
    private var options = [String]()
    
    let cellID = "cellID"
    let footerID = "footerID"
    private var photoViewModels = [PhotoViewModel]()
    
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
    
    fileprivate func fetchRoverPhotos() {
        APIService.shared.fetchSpaceImages(title: name) {[weak self] (photos) in
            self?.photoViewModels = photos.map { return PhotoViewModel(photo: $0)}
            self?.collectionView.reloadData()
        }
    }
    
    fileprivate func configureCameraTypes() {
        if self.name == "Curiosity"{
            options = RoverCamera().curiosity
        }else if self.name == "Opportunity"{
            options = RoverCamera().opportunity
        }else{
            options = RoverCamera().spirit
        }
    }
    
    fileprivate func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(PhotoLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
        return footer
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let height: CGFloat = isPaginatingDone ? 0 : 100
        return .init(width: view.frame.width, height: height)
    }
    
    fileprivate func configureFilterButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease.circle"), style: .done, target: self, action: #selector(tappedFilterButton))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchRoverPhotos()
        configureFilterButton()
        configureCameraTypes()
    }

    fileprivate func fetchRoverPhotos(by cameraType: String) {
        APIService.shared.fetchSpaceImages(title: self.name, with: cameraType) { [weak self](photos) in
            self?.photoViewModels = photos.map { return PhotoViewModel(photo: $0)}
            self?.collectionView.reloadData()
        }
    }
    
    fileprivate func filterTypeSelectionView() {

        let alert = UIAlertController(title: "Filter by Camera Type", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "All", style: .default, handler: {[weak self] (_) in
            self?.fetchRoverPhotos()
        }))
        let closure = { [weak self](action: UIAlertAction!) -> Void in
            let index = alert.actions.lastIndex(of: action)
            
            if index != nil {
                let cameraType = self?.options[index! - 1]
                self?.fetchRoverPhotos(by: cameraType ?? "")
                
            }
        }
        
        for i in 0..<options.count{
            alert.addAction(UIAlertAction(title: options[i], style: .default, handler: closure))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func tappedFilterButton(){
        filterTypeSelectionView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoViewModels.count
    }
    //MARK:- Pagination

    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        isPaginatingDone = false
        if indexPath.row == photoViewModels.count - 1{
            updateNextSet()
        }
        isPaginatingDone = true
    }
    
    fileprivate func fetchRoverPhotosAtPage() {
        APIService.shared.fetchSpaceImages(title: name, page: page) { [weak self](photos) in
            self?.photoViewModels += photos.map { return PhotoViewModel(photo: $0)}
            self?.collectionView.reloadData()
        }
    }
    func updateNextSet(){
        page += 1
        fetchRoverPhotosAtPage()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PhotoCollectionViewCell
        let photoImgUrl = self.photoViewModels[indexPath.row].photoURL
        let url = URL(string: photoImgUrl)
        cell.photo.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height - 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photoViewModels[indexPath.row]
        let controller = PhotoDetailViewController()
        controller.photo = photo
        self.present(controller, animated: true, completion: nil)
    }
}


