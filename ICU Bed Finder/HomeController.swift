//
//  HomeController.swift
//  ICU Bed Finder
//
//  Created by Abdulla Rahman on 22/11/23.
//

import Firebase
import UIKit
import Toast_Swift

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    
     @IBAction func btnLogout(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            self.view.makeToast("You are logged out")
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                let vc = self.storyboard?.instantiateViewController(identifier: "Login") as! LoginController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
        
        catch let error as NSError {
            print("Error Signing Out: \(error)")
        }
        
        
     
     }
}
