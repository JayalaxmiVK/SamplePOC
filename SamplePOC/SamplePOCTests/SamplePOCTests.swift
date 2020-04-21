//
//  SamplePOCTests.swift
//  SamplePOCTests
//
//  Created by Jaya on 19/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import XCTest
import UIKit
@testable import SamplePOC

class SamplePOCTests: XCTestCase {
    var networkManagerMockObject: NetworkManager?
    var tableViewControllerMockObject: MainTableViewController?
    var dataFactoryMockObject: DataFactory?
    
    override func setUp() {
        networkManagerMockObject = NetworkManager()
        tableViewControllerMockObject = MainTableViewController()
        dataFactoryMockObject = DataFactory()
    }

    override func tearDown() {
        networkManagerMockObject = nil
        tableViewControllerMockObject = nil
        dataFactoryMockObject = nil
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testCountryFactDataService(){
        //Set the expection for data download
        let expectation = self.expectation(description: "Download data from Service URL Given")
        
        // make a call to api using mock object
        do{
            try networkManagerMockObject?.getData(UrlString: kCountryDataServiceURLString, completion: { (data, err) in
                
                //Making sure data is downloaded
                XCTAssertNotNil(data, "No data was downloaded.")
                
                // Fulfill the expectation to indicate that the background task has finished successfully.
                expectation.fulfill()
            })
        } catch{
            //Testcase failure
            XCTFail(error.localizedDescription)
        }
       
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        waitForExpectations(timeout: 15.0) { (error) in
            guard let error = error else {return}
            XCTFail(error.localizedDescription)
        }
    }
    
    func testTableviewCellRegistration(){
        //Set the expection
        let expectation = self.expectation(description: "Tableviewcell is registered")
        
        //Set some random index
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableViewControllerMockObject?.tableView(tableViewControllerMockObject!.tableView, cellForRowAt: indexPath)
        
        //Making sure cell is present is downloaded
        XCTAssertNotNil(cell, "Have not resgisterd the tableview cell")
        
        // Fulfill the expectation to indicate that the background task has finished successfully.
        expectation.fulfill()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testJsonDataParsing(){
        //Set the expection
        let expectation = self.expectation(description: "JSON Parsed/Decoded Successfully")
        
        // make a call to api using mock object
        dataFactoryMockObject?.getCountryData(completion: { (info, error) in
            XCTAssertNotNil(info, "Not able to parse JSON data and map to Model object")
            expectation.fulfill()
        })
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
}
