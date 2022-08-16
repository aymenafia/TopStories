//
//  FeedItemsMapper.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 13.08.22.
//

import Foundation

internal final class FeedItemsMapper {
    
    private struct Root: Codable {
        let results: [RemoteFeedItem]
    }
    
    static var OK_200: Int {
        return 200
    }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data)
        else
        {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.results
    }
}



