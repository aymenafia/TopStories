//
//  FeedItem.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 10.08.22.
//

import Foundation

struct FeedItem {
    let id: UUID
    let title: String
    let abstract: String
    let multimedia: [Multimedia]
}

struct Multimedia {
    let url: URL
}
