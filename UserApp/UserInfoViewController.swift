//
//  UserInfoViewController.swift
//  UserApp
//
//  Created by Kuat Bodikov on 21.12.2021.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor,
                                UIColor.blue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
  
    }
    


}
