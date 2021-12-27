

import UIKit
class PeopleViewController: UITableViewController {
    // Hardcoded data for now var
    var peoples : [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllPeople(completionHandler: {
            data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.peoples.append(Person(name: jsonObject["name"] as! String, gender: jsonObject["gender"] as! String, year: jsonObject["birth_year"] as! String, mass: jsonObject["mass"] as! String))
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print("Error \(error)")
            }
        })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peoples.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = peoples[indexPath.row].name
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PeopleDetails", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let peopleDVC = segue.destination as! PeopleDetails
        let indexPath = sender as! IndexPath
        peopleDVC.person = peoples[indexPath.row]
        
    }
    
   
}

struct Person {
    var name:String
    var gender:String
    var year:String
    var mass:String
}
