//
//  MockWebService.swift
//  NewsServiceTests
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

@testable import NewsService
@testable import NewsShared

class MockWebServiceValidResponse: WebService {
    override func request(requestType: ServiceRequestType, requestPath: String) -> ServiceRequest {
        return MockServiceRequestValid(requestPath: requestPath,
                                  requestType: requestType, session: MockSession.shared)
    }
}


class MockServiceRequestValid: ServiceRequest {
    override func fetch() {
        guard let jsonData = TestUtil().data(from: "MockedNewsPageResponse.json",
                                             in:  Bundle(for: TestUtil.self)) else {
            return
        }

        if let responseBlock = self.successBlock {
            responseBlock(jsonData, URLResponse())
        }
    }
}


class MockSession: URLSession {}
