//
//  AddNewController.swift
//  ICU Bed Finder
//
//  Created by Abdulla Rahman on 23/11/23.
//

import UIKit

class AddNewController: UIViewController {
    @IBOutlet weak var labelError: UILabel!
    
    @IBOutlet weak var inputName: UITextField!
    
    @IBOutlet weak var inputContact: UITextField!
    @IBOutlet weak var inputPostal: UITextField!
    @IBOutlet weak var inputDistrict: UITextField!
    @IBOutlet weak var inputStreet: UITextField!
    @IBOutlet weak var inputAvailableBed: UITextField!
    @IBOutlet weak var inputTotalBed: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelError.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSubmit(_ sender: Any) {
        let name:String? = inputName.text
        let total:String? = inputTotalBed.text
        let available:String? = inputAvailableBed.text
        let contact:String? = inputContact.text
        let district:String? = inputDistrict.text
        let postal:String? = inputPostal.text
        let street:String? = inputStreet.text
        
        if((name!.isEmpty) || (total!.isEmpty||available!.isEmpty) || (contact!.isEmpty||postal!.isEmpty) || (district!.isEmpty||street!.isEmpty)){
            labelError.text = "All Field Required"
            labelError.isHidden = false
        }
        
    }
    
    @IBAction func goToDashboard(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "Dashboard") as! DashboardController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}
