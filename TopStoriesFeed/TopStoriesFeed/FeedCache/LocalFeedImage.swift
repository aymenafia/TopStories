//
//  LocalFeedItem.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 14.08.22.
//

import Foundation

public struct LocalFeedImage: Equatable {
    public let id: UUID
    public let title: String?
    public let abstract: String?
    public let storyURL: URL
    public let multimedia: [LocalMultimedia]?
    
    
    public init(id: UUID? = UUID(), title: String?, abstract: String?,storyURL: URL, multimedia: [LocalMultimedia]?) {
        self.id = id ??  UUID()
        self.title = title
        self.abstract = abstract
        self.multimedia = multimedia
        self.storyURL = storyURL
    }
}

public struct LocalMultimedia: Equatable {
    public let url: URL
    
    public init( url: URL) {
        self.url = url
    }
}
