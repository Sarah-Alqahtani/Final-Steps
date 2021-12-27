//
//  FilmsDetails.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 26/12/2021.
//

import UIKit
class FilmsDetails: UIViewController {

    @IBOutlet weak var Titlefilm: UILabel!
    @IBOutlet weak var ReleaseDatefilm: UILabel!
    @IBOutlet weak var Directorfilm: UILabel!
    @IBOutlet weak var OpeningCrawlfilm: UILabel!
     
    
    var film:Film?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let realFilm = film {
            Titlefilm.text = "Title: \(realFilm.title)"
            Directorfilm.text = "Director: \(realFilm.director)"
            ReleaseDatefilm.text = "ReleaseDate: \(realFilm.release_date)"
            OpeningCrawlfilm.text = "Crawl: \(realFilm.opening_crawl)"
        }

       
          //  Titlefilm.text = "Title: \()"
            //ReleaseDatefilm.text = "Release Date: \(Date)"
            //Directorfilm.text = "Director: \(directord)"
            //OpeningCrawlfilm.text = "Opening Crawl: \(openingdd)"
            
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
