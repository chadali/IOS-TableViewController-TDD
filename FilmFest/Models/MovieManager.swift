//
//  MovieManager.swift
//  FilmFest
//
//  Created by ali chaudhry on 7/18/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount:Int { return moviesToSeeArray.count}
    var moviesSeenCount:Int { return moviesSeenArray.count }
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie(movie:Movie) {
        guard !moviesToSeeArray.contains(movie) else {return}
        moviesToSeeArray.append(movie)
    }
    
    func movieAtIndex(index:Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func checkoffMovieAtIndex(index:Int) -> Void {
        guard index < moviesToSeeCount else {return}
        
        let checkedOff = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedOff)
    }
    
    func checkedOffMovieAtIndex(index:Int) -> Movie {
        return moviesSeenArray[index]
    }
    
    func clearArrays() {
        moviesToSeeArray.removeAll()
        moviesSeenArray.removeAll()
    }
}
