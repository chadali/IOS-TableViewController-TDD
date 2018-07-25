//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by ali chaudhry on 7/18/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import XCTest
@testable import FilmFest

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    
    let sciFiMovie = Movie(title: "Sci-Fi")
    let horrorMovie = Movie(title: "Horror")
    let comedyMovie = Movie(title: "Comedy")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie:sciFiMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_RemoveMovieAtIndex() {
        let testMovie = sciFiMovie
        sut.addMovie(movie: testMovie)
        let retrievedMovie = sut.movieAtIndex(index: 0)
        XCTAssertEqual(retrievedMovie.title, "Sci-Fi")
    }
    
    // MARK: Checking Off
    func testCheckoffMovie_UpdateCounts() {
        // Add Movie, Check it off, verify counts
        sut.addMovie(movie: horrorMovie)
        sut.checkoffMovieAtIndex(index:0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemoveMovieFromArray() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: horrorMovie)
        sut.checkoffMovieAtIndex(index: 0)
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, horrorMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: sciFiMovie)
        sut.checkoffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(movieQueried.title, sciFiMovie.title)
    }
    
    // MARK: Clearing arrays
    func testClearArrays_ReturnsArrayCountsOfZero() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: comedyMovie)
        sut.checkoffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: sciFiMovie)
        sut.addMovie(movie: sciFiMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
}
