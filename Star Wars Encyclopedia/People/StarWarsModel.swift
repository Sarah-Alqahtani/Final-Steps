//
//  StarWarsModel.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 25/12/2021.
//

import Foundation
class StarWarsModel {
  
    
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "https://swapi.dev/api/people/?format=json")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
    
}
