//
//  ViewController.swift
//  UserApp
//
//  Created by Kuat Bodikov on 14.12.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userInputTF: UITextField!
    @IBOutlet weak var passwordInputTF: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    var userInput: String!
    var passwordInput: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTF.text = userInput
        passwordInputTF.text = passwordInput
    }

    @IBAction func logInAction() {
      
    }
    
    
}

