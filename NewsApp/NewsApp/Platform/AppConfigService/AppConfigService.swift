//
//  AppConfigService.swift
//  AppConfigService
//
//  Created by Vinodh Govindaswamy on 07/04/20.
//  Copyright © 2020 Vinodh Govindaswamy. All rights reserved.
//

public class AppConfigService {
    public static func topStoriesUIConfig() -> TopStoriesUIConfig {
        return TopStoriesUIConfig()
    }
}

public struct TopStoriesUIConfig {
    static public var worldNewsCategory: NewsCategory = NewsCategory(name: "World", type: "world")
    static public var usNewsCategory: NewsCategory = NewsCategory(name: "US", type: "us")
    static public var sportsNewsCategory: NewsCategory = NewsCategory(name: "Sports", type: "")
    static public var scienceNewsCategory: NewsCategory = NewsCategory(name: "Science", type: "science")
    static public var technologyNewsCategory: NewsCategory = NewsCategory(name: "Technology", type: "technology")
    static public var businessNewsCategory: NewsCategory = NewsCategory(name: "Business", type: "business")
    static public var otherNewsCategory: NewsCategory = NewsCategory(name: "Others", type: "others")


    public var newsCategories: [NewsCategory] = {
        return [TopStoriesUIConfig.worldNewsCategory,
                TopStoriesUIConfig.usNewsCategory,
                TopStoriesUIConfig.scienceNewsCategory,
                TopStoriesUIConfig.businessNewsCategory,
                TopStoriesUIConfig.technologyNewsCategory,
                TopStoriesUIConfig.sportsNewsCategory]
    }()
}

public struct NewsCategory {
    public let name: String
    public let type: String
}

