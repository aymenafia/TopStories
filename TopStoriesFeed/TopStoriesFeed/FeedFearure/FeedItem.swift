//
//  FeedItem.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 10.08.22.
//

import Foundation

public struct FeedItem: Equatable {
    public let id: UUID
    public let title: String?
    public let abstract: String?
    public let storyURL: URL?
    public let multimedia: [Multimedia]?
    
    
    public init(id: UUID, title: String?, abstract: String?,storyURL: URL, multimedia: [Multimedia]?) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.multimedia = multimedia
        self.storyURL = storyURL
    }
}

public struct Multimedia: Equatable, Decodable {
    public let url: URL
    
    public init( url: URL) {
        self.url = url
    }
}

