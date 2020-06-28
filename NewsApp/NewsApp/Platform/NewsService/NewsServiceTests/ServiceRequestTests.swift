//
//  WebServiceTests.swift
//  NewsServiceTests
//
//  Created by Vinodh Govindaswamy on 28/06/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import NewsService

class ServiceRequestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testServiceRequestFetchVerifyData() {
        let request = ServiceRequest(requestPath: "https://api.nytimes.com/svc", session: MockURLSession(fileName: "MockedNewsPageResponse"))
        request.response { (data, response) in
            XCTAssertNotNil(data)
            }.responseError { (error) in
            XCTAssertNil(error)
        }
        request.fetch()
    }

    func testServiceRequestFetchVerifyResponse() {
         let request = ServiceRequest(requestPath: "https://api.nytimes.com/svc", session: MockURLSession(fileName: "MockedNewsPageResponse"))
         request.response { (data, response) in
                XCTAssertNotNil(data)
             }.responseError { (error) in
                XCTAssertNil(error)
         }
         request.fetch()
     }

    func testServiceRequestFetchVerifyInvalidURLError() {
        let request = ServiceRequest(requestPath: "https://api.nytimes.com svc", session: MockURLSession(fileName: "MockedNewsPageErrorResponse"))
        request.response { (data, response) in
            XCTAssertNil(data)
            }.responseError { (error) in
                switch error {
                case .invalidURL:
                    XCTAssertTrue(true)
                default:
                    XCTAssertTrue(false)
                }
        }
        request.fetch()
     }

}
