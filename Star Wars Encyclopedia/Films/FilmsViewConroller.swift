//
//  FilmsViewConroller.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 25/12/2021.
//

import UIKit

struct Film {
    var title:String
    var release_date:String
    var opening_crawl:String
    var director:String
}

class FilmsViewConroller : UITableViewController {
    
    var films : [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModelFilm.getAllFilms(completionHandler: {
            data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.films.append(Film(title: jsonObject["title"] as! String, release_date: jsonObject["release_date"] as! String, opening_crawl: jsonObject["opening_crawl"] as! String, director: jsonObject["director"] as! String))
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error)
            }
        })
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.textLabel?.text = films[indexPath.row].title
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "FilmsDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filmsDVC = segue.destination as! FilmsDetails
        let indexPath = sender as! IndexPath
        filmsDVC.film = films[indexPath.row]
    }
    
 
}

