//
//  WebService.swift
//  NewsService
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation

public let newsNYbaseURL = "https://api.nytimes.com/svc"

public enum NewsServiceError: Swift.Error {
    /// Failed due to network error.
    case networkError(statusCode: Int)

    /// Failed for a reason that could be decoded
    case decodedError(decodedError: Any)

    /// Failed due to invalid URL
    case invalidURL

    /// Failed due to unknow reason like not able to decode url response
    case unKnown(error: Error?)
}

typealias ResponseBlock = (_ data: Data, _ response: URLResponse) -> Void
typealias ErrorBlock = ((_ error: NewsServiceError?) -> Void)

class WebService {
    private let session = URLSession(configuration: URLSessionConfiguration.default)

    private var baseURL: String {
        return newsNYbaseURL
    }

    func request(requestType: ServiceRequestType, requestPath: String) -> ServiceRequest {
        return ServiceRequest(requestPath: "\(baseURL)/\(requestPath)",
                              requestType: requestType,
                              session: session)
    }
}

enum ServiceRequestType: String {
    case GET = "GET"
    case POST = "POST"
}

class ServiceRequest {
    private let requestPath: String
    private let requestType: ServiceRequestType
    private let session: URLSession
    private let responseQueue: DispatchQueue = DispatchQueue.main

    private var requestParam: [String: String]?
    internal var successBlock: ResponseBlock?
    internal var errorBlock: ErrorBlock?

    init(requestPath: String,
         requestType: ServiceRequestType = .GET,
         session: URLSession) {
        self.requestPath = requestPath
        self.requestType = requestType
        self.session = session
    }

    func fetch() {
        let query = queryString(params: requestParam)
        var fullUrlString = requestPath
        if !query.isEmpty { fullUrlString = "\(fullUrlString)?\(query)" }

        guard let url = URL(string: fullUrlString) else {
            if let errorBlock = errorBlock {
                errorBlock(NewsServiceError.invalidURL)
            }
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            self.handle(data: data,
                         response: response,
                         error: error)
        })
        task.resume()
    }

    func setQuery(params: [String: String]) {
        requestParam = params
    }

    func response(_ block: @escaping ResponseBlock) -> ServiceRequest {
        successBlock = block
        return self
    }

    func responseError(_ block: @escaping ErrorBlock) {
        errorBlock = block
    }

    private func handle(data: Data?, response: URLResponse?, error: Error?) {

        responseQueue.async {
            guard let urlResponse = response as? HTTPURLResponse else {
                if let errorBlock = self.errorBlock {
                    errorBlock(NewsServiceError.unKnown(error: error))
                }
                return
            }

            switch urlResponse.statusCode {

                case 200..<300:
                    if let responseBlock = self.successBlock,
                        let jsonData = data {
                        responseBlock(jsonData, urlResponse)
                    }

                default:
                    if let errorBlock = self.errorBlock {
                        errorBlock(NewsServiceError.networkError(statusCode: urlResponse.statusCode))
                    }
            }

        }
    }

    private func queryString(params: [String: String]?) -> String {
        var query = ""
        guard let queryParam = params else { return query }
        queryParam.forEach { (arg0) in
            let (key, value) = arg0
            if !value.isEmpty {
                query.append(contentsOf: "\(key)=\(value)")
                query.append("&")
            }
        }
        query = query.trimmingCharacters(in: CharacterSet(charactersIn: "&"))
        return query
    }
}
