//
//  RegisterViewController.swift
//  DemoChatApp
//
//  Created by Lily Tran on 20/6/24.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEnterPass: UITextField!
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var avatarImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
    }

    func setupUI(){
        txtEmail.layer.cornerRadius = 10
        txtEmail.layer.borderWidth = 1
        txtEmail.layer.borderColor = UIColor.lightGray.cgColor
        txtEmail.placeholder = "Email Address"
        
        txtFirstName.layer.cornerRadius = 10
        txtFirstName.layer.borderWidth = 1
        txtFirstName.layer.borderColor = UIColor.lightGray.cgColor
        txtFirstName.placeholder = "First Name"
        
        txtLastName.layer.cornerRadius = 10
        txtLastName.layer.borderWidth = 1
        txtLastName.layer.borderColor = UIColor.lightGray.cgColor
        
        txtPassword.layer.cornerRadius = 10
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = UIColor.lightGray.cgColor
        txtPassword.isSecureTextEntry = true
        
        txtEnterPass.layer.cornerRadius = 10
        txtEnterPass.layer.borderWidth = 1
        txtEnterPass.layer.borderColor = UIColor.lightGray.cgColor
        txtEnterPass.isSecureTextEntry = true
        
        avatarImg.layer.masksToBounds = true
        avatarImg.layer.borderWidth = 2
        avatarImg.layer.borderColor = UIColor.lightGray.cgColor
        
        
        btnSignup.layer.cornerRadius = 10
        
    }
    @IBAction func btnSignupTapped(_ sender: Any) {
        guard let email = txtEmail.text, let password = txtPassword.text, let enterPass = txtEnterPass.text, let firstName = txtFirstName.text, let lastName = txtLastName.text, !firstName.isEmpty, !lastName.isEmpty,!email.isEmpty, !password.isEmpty, !enterPass.isEmpty, enterPass == password, password.count >= 6 else {
            alertUserLoginError()
            return
        }
        
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops", message: "Please enter all information to create an acount", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func changeAvatarTapped(_ sender: Any) {
        presentPhotoActionSheet()
    }
    
    override func viewDidLayoutSubviews() {
        avatarImg.layer.cornerRadius = avatarImg.frame.size.width/2.0
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet(){
        let  actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self] _ in self?.presentCamera() }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: {[weak self] _ in self?.presentPhoto()}))
        
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhoto() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
       self.avatarImg.image = selectedImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
