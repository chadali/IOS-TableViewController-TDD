//
//  MovieLibraryDataServiceTest.swift
//  FilmFestTests
//
//  Created by ali chaudhry on 7/23/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import XCTest
@testable import FilmFest

class MovieLibraryDataServiceTest: XCTestCase {
    
    var sut:MovieLibraryDataService!
    var libraryTableView:UITableView!
    var libraryVC:LibraryViewController!
    
    var tableViewMock:TableViewMock!

    let thriller = Movie(title: "thriller")
    let comedy = Movie(title: "comedy")
    let action = Movie(title: "action")

    override func setUp() {
        super.setUp()
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)

        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Section
    func testTableViewSections_Count_ReturnsTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMovieCountsToSee() {
//        sut.movieManager?.addMovie(movie: thriller)
//        sut.movieManager?.addMovie(movie: comedy)
//
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//
//        sut.movieManager?.addMovie(movie: action)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount() {
//        sut.movieManager?.addMovie(movie: thriller)
//        sut.movieManager?.addMovie(movie: comedy)
//        sut.movieManager?.checkoffMovieAtIndex(index: 0)
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//
//        sut.movieManager?.checkoffMovieAtIndex(index: 0)
//        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    // MARK: Cell
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: comedy)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell() {
        sut.movieManager?.addMovie(movie: comedy)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: comedy)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, comedy)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: comedy)
        sut.movieManager?.addMovie(movie: thriller)
        sut.movieManager?.checkoffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, comedy)
    }
    
    func testCell_Selection_ShouldCheckoffSelectedMovie() {
        sut.movieManager?.addMovie(movie: action)
        sut.movieManager?.addMovie(movie: comedy)
        libraryTableView.delegate?.tableView!(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValue() {
        let section1Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 0 )
        let section2Title = libraryTableView.dataSource?.tableView!(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2Title, "Movies Seen")
        
    }
    
}
