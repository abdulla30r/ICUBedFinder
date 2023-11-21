//
//  ViewController.swift
//  ICU Bed Finder
//
//  Created by Abdulla Rahman on 16/11/23.
//

import UIKit
import FirebaseAuth
import Toast_Swift

class ViewController: UIViewController {

    

    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelError.isHidden = true
    }

    @IBAction func didTapLogin(_ sender: Any) {
        let email:String? = inputEmail.text
        let password:String? = inputPassword.text
        
        if((email!.isEmpty) || (password!.isEmpty)){
            labelError.text = "All Field Required"
            labelError.isHidden = false
        }
        
        
        else {
            
            Auth.auth().signIn(withEmail: email!, password: password!) { (authResult, error) in
                if let error = error {
                    self.labelError.text = error.localizedDescription
                    self.labelError.isHidden = false
                }
                else{
                    self.view.makeToast("Login Successfull")
                }
            }
        }
    }
    
    @IBAction func goToReg(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "Signup") as! SignupController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
