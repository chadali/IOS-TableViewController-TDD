//
//  Movie.swift
//  FilmFest
//
//  Created by ali chaudhry on 7/18/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let title:String
    let releaseDate:String?
    
    init(title:String, releaseDate:String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func == (lhs: Movie, rhs: Movie) -> Bool {
    return (lhs.title == rhs.title) && (lhs.releaseDate == rhs.releaseDate)
}
