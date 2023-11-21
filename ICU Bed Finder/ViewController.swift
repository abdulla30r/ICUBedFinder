//
//  ViewController.swift
//  ICU Bed Finder
//
//  Created by Abdulla Rahman on 16/11/23.
//

import UIKit

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
            labelError.text = email! + password!
            labelError.isHidden = false
            labelError.text = "abdulla"
        }
    }
    
    @IBAction func goToReg(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "Signup") as! SignupController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
