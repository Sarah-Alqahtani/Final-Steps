//
//  FilmsViewConroller.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 25/12/2021.
//

import UIKit

class FilmsViewConroller: UITableViewController {
    var Film:[String] = []
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        StarWarsModelFilm.getAllFilms(completionHandler: {
            // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                data, response, error in
                    do {
                        // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            if let results = jsonResult["results"] as? NSArray {
                                for person in results {
                                    let personDict = person as! NSDictionary
                                    self.Film.append(personDict["title"]! as! String)
                                }
                            }
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Something went wrong")
                    }
            })
        }
          
                

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return Film.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = Film[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
}
