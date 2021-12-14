//
//  WelcomeViewController.swift
//  UserApp
//
//  Created by Kuat Bodikov on 14.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var userLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let loginViewController = segue.destination as! LoginViewController
        loginViewController.userInput = userLabel.text
        
    }

    @IBAction func logOutAction() {
        dismiss(animated: true)
    }
    
}
