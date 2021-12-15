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

    
    private var name = "Kuat"
    private var password = "Genius"
    
    var clearUser: String!
    var clearPassword: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTF.text = clearUser
        passwordInputTF.text = clearPassword
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userLogin = userInputTF.text
    }
    
    @IBAction func logInAction() {

        guard let inputText = userInputTF.text, !inputText.isEmpty else {
            showAlert(title: "User name is empty", message: "Please enter your name")
            return
        }
        
        if userInputTF.text != name {
            showAlert(title: "Incorrect user name", message: "Please enter correct name")
            return
        } else if passwordInputTF.text != password {
            showAlert(title: "Incorrect password", message: "Please enter correct password")
            return
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let welocomViewController = segue.destination as! WelcomeViewController
        userInputTF.text = welocomViewController.clearUser
        passwordInputTF.text = welocomViewController.clearPassword
    }
    
    @IBAction func showUserNameAction() {
       userNameAlert(title: "User name is", message: "\(name)")
    }
    
    @IBAction func showPasswordAction() {
        passwordAlert(title: "User password is", message: "\(password)")
    }
    
}
// MARK: - ALerts
extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userInputTF.text = ""
            self.passwordInputTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    private func userNameAlert(title: String, message: String) {
        let userAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let getUser = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userInputTF.text = self.name
        }
        userAlert.addAction(getUser)
        present(userAlert, animated: true)
    }

    private func passwordAlert(title: String, message: String) {
        let passwordAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let getPassword = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordInputTF.text = self.password
        }
        passwordAlert.addAction(getPassword)
        present(passwordAlert, animated: true)
    }
}
