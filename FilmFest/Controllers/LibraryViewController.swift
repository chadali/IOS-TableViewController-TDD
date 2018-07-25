//
//  ViewController.swift
//  FilmFest
//
//  Created by ali chaudhry on 7/18/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "First Movie"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Second Movie", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Second Movie", releaseDate: "2000"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Second Movie", releaseDate: "2001"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Second Movie", releaseDate: "2002"))
        libraryTableView.reloadData()

    }

}

