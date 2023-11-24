//
//  ModifyController.swift
//  ICU Bed Finder
//
//  Created by Abdulla Rahman on 24/11/23.
//

import UIKit

class ModifyController: UIViewController {

    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputTotalBed: UITextField!
    @IBOutlet weak var inputStreet: UITextField!
    @IBOutlet weak var inputAvailableBed: UITextField!
    @IBOutlet weak var inputDistrict: UITextField!
    @IBOutlet weak var inputPostal: UITextField!
    @IBOutlet weak var inputContact: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        labelError.isHidden = true
    }
    

    @IBAction func btnUpdate(_ sender: Any) {
    }
    

    @IBAction func goToDashboard(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "Dashboard") as! DashboardController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
