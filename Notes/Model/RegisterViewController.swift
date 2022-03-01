//
//  RegisterViewController.swift
//  Notes
//
//  Created by Raseswari Das on 10/25/18.
//  Copyright © 2018 Raseswari Das. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func accountAvailablePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonClick(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if(email == nil || password == nil) {
            self.showAlertMessage(msg: "Email/Password cannot be empty!")
            return
        }
        
        Auth.auth().createUser(withEmail: email!, password: password!){ (authResult, error) in
            if error == nil {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func showAlertMessage(msg: String) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
