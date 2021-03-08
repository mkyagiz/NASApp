//
//  PhotoLoadingFooter.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 7.03.2021.
//

import UIKit

class PhotoLoadingFooter: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .darkGray
        activityIndicator.startAnimating()
        
        let label = UILabel(text: "Loading more...", fontSize: 16)
        label.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [activityIndicator, label])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
