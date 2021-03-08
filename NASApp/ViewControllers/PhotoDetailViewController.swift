//
//  PhotoDetailViewController.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 2.03.2021.
//

import UIKit

//Receive Class

class PhotoDetailViewController: UIViewController {
    
    var photo: PhotoViewModel?{
        didSet{
            configureUI()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.removeFromParent()
        dismiss(animated: true, completion: nil)
    }
        
    var photoDate = UILabel(text: "Date")
    var roverName = UILabel(text: "Rover Name")
    var cameraType = UILabel(text: "Camera Type")
    var roverStatus = UILabel(text: "Rover Status")
    var landingDate = UILabel(text: "Landing Date")
    var launchDate = UILabel(text: "Launch Date")
    
    var photoDateLabel = UILabel(text: "Photo Date:", fontSize: 16)
    var roverNameLabel = UILabel(text: "Rover Name:", fontSize: 16)
    var cameraTypeLabel = UILabel(text: "Camera Type:", fontSize: 16)
    var roverStatusLabel = UILabel(text: "Rover Status:", fontSize: 16)
    var landingDateLabel = UILabel(text: "Landing Date:", fontSize: 16)
    var launchDateLabel = UILabel(text: "Launch Date:", fontSize: 16)

    var image: UIImageView = {
        let img = UIImageView()
        img.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        img.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2).isActive = true
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
       return img
    }()
    
    fileprivate func configureUI() {
        self.roverName.text = self.photo?.roverName
        self.cameraType.text = photo?.cameraTypeFullName
        self.photoDate.text = photo?.photoDate
        self.landingDate.text = photo?.landingDate
        self.launchDate.text = photo?.launchDate
        self.roverStatus.text = photo?.roverStatus
        let url = URL(string: photo?.photoURL ?? "")
        self.image.kf.setImage(with: url)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraType.numberOfLines = 2
        cameraTypeLabel.setContentHuggingPriority(.required, for: .horizontal)
        cameraType.preferredMaxLayoutWidth = view.frame.width / 2
        view.backgroundColor = .white
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        setupStackView()
    }
    
    
    fileprivate func setupStackView() {
        let photoDateStackView = UIStackView(arrangedSubviews: [photoDateLabel, photoDate])
        photoDateStackView.spacing = 8
        let roverNameStackView = UIStackView(arrangedSubviews: [roverNameLabel, roverName])
        roverNameStackView.spacing = 8
        let cameraTypeStackView = UIStackView(arrangedSubviews: [cameraTypeLabel, cameraType])
        cameraTypeStackView.spacing = 8
        let roverStatusStackView = UIStackView(arrangedSubviews: [roverStatusLabel, roverStatus])
        roverStatusStackView.spacing = 8
        let landingStackView = UIStackView(arrangedSubviews: [landingDateLabel, landingDate])
        landingStackView.spacing = 8
        let launchDateStackView = UIStackView(arrangedSubviews: [launchDateLabel, launchDate])
        launchDateStackView.spacing = 8
        let stackView = UIStackView(arrangedSubviews: [photoDateStackView, roverNameStackView, cameraTypeStackView, roverStatusStackView, landingStackView, launchDateStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 3
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
