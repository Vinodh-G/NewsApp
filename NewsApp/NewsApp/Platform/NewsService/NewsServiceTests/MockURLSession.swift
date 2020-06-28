//
//  MockURLSession.swift
//  MusicServiceTests
//
//  Created by Vinodh Govindaswamy on 28/06/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation

class MockURLSession: URLSession {

    var fileName: String = ""
    init(fileName: String) {
        self.fileName = fileName
    }

    override func dataTask(with request: URLRequest,
                           completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockDataTask(fileName: fileName,
                            handler: completionHandler)
    }
}

class MockDataTask: URLSessionDataTask {
    let handler: (Data?, URLResponse?, Error?) -> Void
    let fileName: String
    init(fileName: String, handler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.fileName = fileName
        self.handler = handler
    }

    override func resume() {
        guard let path = Bundle(for: MockDataTask.self).path(forResource: fileName, ofType: "json") else {
            self.handler(nil, nil, nil)
            return
        }

        do {
            let fileUrl = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: fileUrl)
            self.handler(data, HTTPURLResponse(url: fileUrl,
                                               statusCode: 200,
                                               httpVersion: nil,
                                               headerFields: nil), nil)
        } catch let error {
            self.handler(nil, nil, error)
        }
    }
}
