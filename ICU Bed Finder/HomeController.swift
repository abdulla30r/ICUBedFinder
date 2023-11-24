import UIKit
import FirebaseFirestore

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var hospitals: [Hospital] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Set the table view separator style to none
        tableView.separatorStyle = .none

        // Fetch data from Firestore
        fetchDataFromFirestore()
    }

    func fetchDataFromFirestore() {
        let db = Firestore.firestore()

        db.collection("Hospitals").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                // Clear the existing data
                self.hospitals.removeAll()

                // Loop through the documents and populate the hospitals array
                for document in querySnapshot!.documents {
                    let data = document.data()

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
                        self.hospitals.append(hospital)
                    } else {
                        print("Invalid data format for document: \(document.documentID)")
                    }
                }

                // Reload the table view to reflect the updated data
                self.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let hospital = hospitals[indexPath.row]

        // Configure the appearance of the cell to give it a card-like effect
        cell.textLabel?.text = hospital.name
        cell.detailTextLabel?.text = "Total Beds: \(hospital.totalBed), Available Beds: \(hospital.availableBed), \(hospital.district)"

        // Customize the appearance of the cell
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.backgroundColor = UIColor.white
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 4

        return cell
    }

}
