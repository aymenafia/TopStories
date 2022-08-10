//
//  FeedLoader.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 10.08.22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
