//
//  DashboardController.swift
//  ICU Bed Finder
//
//  Created by Abdulla Rahman on 23/11/23.
//

import UIKit

class DashboardController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addNew(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "AddNew") as! AddNewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    @IBAction func AdminLogout(_ sender: Any) {
        self.view.makeToast("Logout Successfull")
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            let vc = self.storyboard?.instantiateViewController(identifier: "Login") as! LoginController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
}
