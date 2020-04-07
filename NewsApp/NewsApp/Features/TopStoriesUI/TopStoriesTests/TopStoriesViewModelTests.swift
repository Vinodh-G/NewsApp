//
//  TopStoriesViewModelTests.swift
//  TopStoriesTests
//
//  Created by Vinodh Govindaswamy on 28/03/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

import XCTest
@testable import TopStoriesUI
@testable import NewsService

class TopStoriesViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCollectionDataNotNilBeforeFetch() {
        let viewModel = mockViewModel()
        XCTAssertNil(viewModel.collectionViewData)
    }

    func testCollectionDataNotNilAfterFetch() {
        let viewModel = mockViewModel()
        viewModel.fetchTopStories()
        XCTAssertNotNil(viewModel.collectionViewData)
    }

    func testCollectionDataSectionCountForValidData() {
        let viewModel = mockViewModel()
        viewModel.fetchTopStories()
        XCTAssertEqual(viewModel.collectionViewData?.sections.count, 4)
    }

    func testCollectionDataSectionCountForInValidData() {
        let viewModel = mockViewModel(mockFile: "MockedNewsPageErrorResponse.json")
        viewModel.fetchTopStories()
        XCTAssertEqual(viewModel.collectionViewData?.sections.count, 1)
    }

    func testCollectionDataErrorSectionTypeForInValidData() {
        let viewModel = mockViewModel(mockFile: "MockedNewsPageErrorResponse.json")
        viewModel.fetchTopStories()
        XCTAssertEqual(viewModel.collectionViewData?.sections[0].sectionType, NewsSectionType.error.rawValue)
    }

    func testCollectionDataSectionNewsCatTypeWorld() {
        let viewModel = mockViewModel()
        viewModel.fetchTopStories()
        XCTAssertEqual((viewModel.collectionViewData?.sections[0] as? NewsSectionModel)?.categoryType, "world")
    }

    func testCollectionDataSectionNewsCatTypeHealth() {
        let viewModel = mockViewModel()
        viewModel.fetchTopStories()
        XCTAssertEqual((viewModel.collectionViewData?.sections[1] as? NewsSectionModel)?.categoryType, "health")
    }

    func testCollectionDataSectionNewsCatTypeScience() {
        let viewModel = mockViewModel()
        viewModel.fetchTopStories()
        XCTAssertEqual((viewModel.collectionViewData?.sections[2] as? NewsSectionModel)?.categoryType, "science")
    }


    func testCollectionDataSectionNewsCatTypeOthers() {
        let viewModel = mockViewModel()
        viewModel.fetchTopStories()
        XCTAssertEqual((viewModel.collectionViewData?.sections[3] as? NewsSectionModel)?.categoryType, "others")
    }

    func mockViewModel(mockFile: String = "MockedNewsPageResponse.json") -> TopStoriesViewModel {
        let interactor = TopStoriesInteractor(service: MockNewsService(path: mockFile))
        return TopStoriesViewModel(newsPageName: "home",
                                   interator: interactor)
    }
}

