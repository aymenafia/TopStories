//
//  FeedItem.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 10.08.22.
//

import Foundation

public struct FeedImage: Hashable {
    public let title: String?
    public let abstract: String?
    public let byline: String?
    public let url: URL
    public let storyURL: URL?
    public let multimedia: [Multimedia]
    
    public init(title: String?, abstract: String?,byline: String?, storyURL: URL?, multimedia: [Multimedia], url: URL) {
        self.title = title
        self.abstract = abstract
        self.multimedia = multimedia
        self.storyURL = storyURL
        self.byline = byline
        self.url = url
    }
}

public struct Multimedia: Hashable, Codable {
    public let url: URL
    
    public init( url: URL) {
        self.url = url
    }
}

