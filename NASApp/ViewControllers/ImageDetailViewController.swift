//
//  ImageDetailViewController.swift
//  NASApp
//
//  Created by ASD on 2.03.2021.
//

import UIKit

//Boss

class ImageDetailViewController: UIViewController {
    
    var photoDate = UILabel(text: "Date      ")
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
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(image)
        setupStackView()
    }
    
    fileprivate func setupStackView() {
        let photoDateStackView = UIStackView(arrangedSubviews: [photoDateLabel, photoDate])
        photoDateStackView.spacing = 16
        let roverNameStackView = UIStackView(arrangedSubviews: [roverNameLabel, roverName])
        roverNameStackView.spacing = 16
        let cameraTypeStackView = UIStackView(arrangedSubviews: [cameraTypeLabel, cameraType])
        cameraTypeStackView.spacing = 16
        let roverStatusStackView = UIStackView(arrangedSubviews: [roverStatusLabel, roverStatus])
        roverStatusStackView.spacing = 16
        let landingStackView = UIStackView(arrangedSubviews: [landingDateLabel, landingDate])
        landingStackView.spacing = 16
        let launchDateStackView = UIStackView(arrangedSubviews: [launchDateLabel, launchDate])
        launchDateStackView.spacing = 16
        let stackView = UIStackView(arrangedSubviews: [photoDateStackView, roverNameStackView, cameraTypeStackView, roverStatusStackView, landingStackView, launchDateStackView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 16
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
