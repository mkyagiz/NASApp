//
//  BaseTabController.swift
//  NASApp
//
//  Created by M.Kasim Yagiz on 2.03.2021.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [createNavController(viewcontroller: PhotoCollectionViewController(title: "Curiosity"),  title: "Curiosity"), createNavController(viewcontroller: PhotoCollectionViewController(title: "Opportunity"), title: "Opportunity"), createNavController(viewcontroller: PhotoCollectionViewController(title: "Spirit"), title: "Spirit")]
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    fileprivate func createNavController(viewcontroller: UIViewController, title: String) -> UIViewController{
        let navController = UINavigationController(rootViewController: viewcontroller)
        viewcontroller.view.backgroundColor = .white
        viewcontroller.navigationItem.title = title
        navController.tabBarItem.title = title
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 14)]
        appearance.setTitleTextAttributes(attributes, for: .normal)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}


