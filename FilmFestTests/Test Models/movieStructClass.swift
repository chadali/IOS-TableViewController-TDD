//
//  movieStructClass.swift
//  FilmFestTests
//
//  Created by ali chaudhry on 7/18/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import XCTest
@testable import FilmFest

class movieStructClass: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Initialization
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Blockbuster")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Romantic Comedy", releaseDate: "1987")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }
    
    // MARK: Equiatables
    func testEquatable_ReturnsTrue() {
        let comedyMovie1 = Movie(title: "Comedy")
        let comedyMovie2 = Movie(title: "Comedy")
        
        XCTAssertEqual(comedyMovie1, comedyMovie2)
    }
    
    func testEquatable_ReturnsTrueIfTitlesSame() {
        let comedyMovie1 = Movie(title: "Comedy")
        let comedyMovie2 = Movie(title: "Horror")
        let comedyMovie3 = Movie(title: "Comedy")
        XCTAssertNotEqual(comedyMovie1, comedyMovie2)
        XCTAssertEqual(comedyMovie1, comedyMovie3)
    }
    
    func testEquatable_ReturnsTrueOnlyForSameReleaseDates() {
        let comedyMovie1 = Movie(title: "Comedy", releaseDate: "1999")
        let comedyMovie2 = Movie(title: "Comedy", releaseDate: "1999")
        let comedyMovie3 = Movie(title: "Comedy", releaseDate: "2000")
        XCTAssertEqual(comedyMovie1, comedyMovie2)
        XCTAssertNotEqual(comedyMovie2, comedyMovie3)
    }
}


