//
//  MovieCell.swift
//  FilmFest
//
//  Created by ali chaudhry on 7/23/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configMovieCell(movie: Movie) {
        self.textLabel?.text =  movie.title
        self.detailTextLabel?.text = movie.releaseDate
        
    }

}
