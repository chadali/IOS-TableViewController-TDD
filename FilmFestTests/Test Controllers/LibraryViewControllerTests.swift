//
//  LibraryViewControllerTests.swift
//  FilmFestTests
//
//  Created by ali chaudhry on 7/23/18.
//  Copyright © 2018 ali chaudhry. All rights reserved.
//

import XCTest
@testable import FilmFest

class LibraryViewControllerTests: XCTestCase {
    
    var sut:LibraryViewController!
    
    override func setUp() {
        super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"LibraryViewControllerID") as! LibraryViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Nil Checks
    func testLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    // MARK: Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    // MARK: Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    // MARK: Data Service Assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }
    
}
