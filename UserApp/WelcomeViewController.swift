//
//  WelcomeViewController.swift
//  UserApp
//
//  Created by Kuat Bodikov on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var userLabel: UILabel!
    
    var userLogin: User!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = "\(userLogin.person.fullname)"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor,
                                UIColor.blue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
