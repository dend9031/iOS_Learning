//
//  examples_23Tests.swift
//  examples_23Tests
//
//  Created by Artem Cherkasov on 8/12/16.
//  Copyright © 2016 Artem Cherkasov. All rights reserved.
//

import XCTest
@testable import examples_23




class examples_23Tests: XCTestCase {
    var viewController = ViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDogMyCats(){
        let input  = "cats"
        let output = "dogs"
        
        XCTAssertEqual(output, self.viewController.dogMyCats(input),"Faied to produce \(output) from \(input)")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
