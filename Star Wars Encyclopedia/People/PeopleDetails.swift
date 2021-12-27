//
//  PeopleDetails.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 26/12/2021.
//

import UIKit

class PeopleDetails: UIViewController {

    @IBOutlet weak var Namedetail: UILabel!
    @IBOutlet weak var Genderdetail: UILabel!
    @IBOutlet weak var BirthYeardetail: UILabel!
    @IBOutlet weak var Massdetail: UILabel!
    
    var person : Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realPerson = person {
            Namedetail.text = "Name: \(realPerson.name)"
            Genderdetail.text = "Gender: \(realPerson.gender)"
            BirthYeardetail.text = "BirthYeardetail: \(realPerson.year)"
            Massdetail.text = "Mass: \(realPerson.mass)"
        }

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
