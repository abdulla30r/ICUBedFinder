//
//  DashboardController.swift
//  ICU Bed Finder
//
//  Created by Abdulla Rahman on 23/11/23.
//

import UIKit
import FirebaseFirestore

class DashboardController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var DataTable: UITableView!
    var hospitalInfo: [Hospital] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataTable.dataSource = self
        DataTable.delegate = self
        let  nib = UINib(nibName: "TableViewCell", bundle: nil)
        DataTable.register(nib, forCellReuseIdentifier: "TableViewCell")
        fetchDataFromFirestore()

    }
    
    func fetchDataFromFirestore() {
        let db = Firestore.firestore()

        db.collection("Hospitals").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                // Clear the existing data
                self.hospitalInfo.removeAll()

                // Loop through the documents and populate the hospitals array
                for document in querySnapshot!.documents {
                    
                    let data = document.data()
                    let did = document.documentID

                    // Assuming you have a Hospital initializer that requires parameters
                    if let name = data["name"] as? String,
                       let totalBed = data["totalBed"] as? Int,
                       let availableBed = data["availableBed"] as? Int,
                       let street = data["street"] as? String,
                       let district = data["district"] as? String,
                       let postalCode = data["postalCode"] as? Int,
                       let contact = data["contact"] as? Int {
                       
                        let hospital = Hospital(
                            name: name,
                            totalBed: totalBed,
                            availableBed: availableBed,
                            street: street,
                            district: district,
                            postalCode: postalCode,
                            contact: contact
                        )
                        hospital.id = did
                        self.hospitalInfo.append(hospital)
                    } else {
                        print("Invalid data format for document: \(document.documentID)")
                    }
                }

                // Reload the table view to reflect the updated data
                self.DataTable.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitalInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let hospital = hospitalInfo[indexPath.row]
        cell.district.text = hospital.district
        cell.name.text = hospital.name
        cell.AvailableBeds.text = "Available Beds: " + String(hospital.availableBed)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            // Return the desired height for the cell at the specified indexPath
        return 207.0 // Adjust this value as needed
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "Modify") as! ModifyController
        vc.id = hospitalInfo[indexPath.row].id
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
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
