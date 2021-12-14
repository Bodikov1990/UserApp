//
//  WelcomeViewController.swift
//  UserApp
//
//  Created by Kuat Bodikov on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var userLabel: UILabel!
    
    var userLogin: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = userLogin
    }
    @IBAction func logOutAction() {
        dismiss(animated: true) {
        }
    }
    
}
