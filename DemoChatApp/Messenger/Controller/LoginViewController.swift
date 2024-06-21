//
//  ViewController.swift
//  DemoChatApp
//
//  Created by Lily Tran on 20/6/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Log In"
        view.backgroundColor = .white
        
        setupUI()
        
        txtEmail.delegate = self
        txtPass.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        txtEmail.layer.cornerRadius = 10
        txtEmail.layer.borderWidth = 1
        txtEmail.layer.borderColor = UIColor.lightGray.cgColor
        
        txtPass.layer.cornerRadius = 10
        txtPass.layer.borderWidth = 1
        txtPass.layer.borderColor = UIColor.lightGray.cgColor
        txtPass.isSecureTextEntry = true
        
        btnLogin.layer.cornerRadius = 10
        
        
    }
    

    @IBAction func btnRegister(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnButton(_ sender: Any) {
        guard let email = txtEmail.text, let password = txtPass.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserLoginError()
            return
        }
    }
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops", message: "Please enter all information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

}
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtEmail {
            txtPass.becomeFirstResponder()
        }
        else if textField == txtPass {
            btnButton(btnLogin)
        }
        return true
    }
}
