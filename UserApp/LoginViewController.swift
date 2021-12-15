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
    
    private var name = "Kuat"
    private var password = "Genius"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInputTF.delegate = self
        passwordInputTF.delegate = self
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor,
                                UIColor.blue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeVC = segue.destination as! WelcomeViewController
        welcomeVC.userLogin = userInputTF.text
    }
    
    @IBAction func logInAction(_ sender: UIButton) {
        chekForValid()
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        let welocomViewController = segue.source as! WelcomeViewController
        userInputTF.text = ""
        passwordInputTF.text = ""
    }
    
    @IBAction func showUserNameAction() {
        userNameAlert(title: "User name is", message: "\(name)")
    }
    
    @IBAction func showPasswordAction() {
        passwordAlert(title: "User password is", message: "\(password)")
    }
    
    private func chekForValid() {
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

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userInputTF {
            passwordInputTF.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == passwordInputTF {
            performSegue(withIdentifier: "welcomeVC", sender: self)
        }
    }
}
