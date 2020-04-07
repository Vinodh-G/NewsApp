//
//  NewsTestUtil.swift
//  NewsServiceTests
//
//  Created by Vinodh Govindaswamy on 24/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import Foundation

public enum NewsXCTestError: Error {
    case failedToLoad
}

public class TestUtil {
    public func get <T: Decodable>(from filePath : String,
                                   in bundle: Bundle) throws -> T  {

        if let jsonData = data(from: filePath,
                               in: bundle) {
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let val = try decoder.decode(T.self,
                                             from: jsonData)
                return val
            } catch {
                throw NewsXCTestError.failedToLoad
            }
        } else {
            throw NewsXCTestError.failedToLoad
        }
    }

    public func data(from filePath: String,
                     in bundle: Bundle) -> Data? {

        guard let validFullPath = bundle.path(forResource: filePath,
                                              ofType: nil),
            FileManager.default.fileExists(atPath: validFullPath),
            let rawFileData = try? Data(contentsOf: URL(fileURLWithPath: validFullPath)) else {
            return nil
        }
        return rawFileData
    }
}
