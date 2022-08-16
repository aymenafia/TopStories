//
//  RemoteFeedItem.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 14.08.22.
//

import Foundation

internal struct RemoteFeedItem: Codable {
    internal let title: String?
    internal let abstract: String?
    internal let url: URL
    internal let multimedia: [Multimedia]
    internal let byline: String?
}
