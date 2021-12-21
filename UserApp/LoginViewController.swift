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
    
    private let user = User.getUserData()

    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor,
                                UIColor.blue.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userLogin = user
            } else if let navigationVC = viewController as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
            }
        }
    }
    
    @IBAction func logInAction() {
        if userInputTF.text != user.login || passwordInputTF.text != user.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password"
            )
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userInputTF.text = ""
        passwordInputTF.text = ""
    }
    
    @IBAction func showUserNameAction() {
        userNameAlert(title: "User name is", message: "\(user.login)")
    }
    
    @IBAction func showPasswordAction() {
        passwordAlert(title: "User password is", message: "\(user.password)")
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
            self.userInputTF.text = self.user.login
        }
        userAlert.addAction(getUser)
        present(userAlert, animated: true)
    }
    
    private func passwordAlert(title: String, message: String) {
        let passwordAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let getPassword = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordInputTF.text = self.user.password
        }
        passwordAlert.addAction(getPassword)
        present(passwordAlert, animated: true)
    }
}

//MARK: - Private methods
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userInputTF {
            passwordInputTF.becomeFirstResponder()
        } else {
            logInAction()
            performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
        return true
    }
}
