//
//  FeedItemsMapper.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 13.08.22.
//

import Foundation


internal final class FeedItemMapper {
    
    static var OK_200: Int {
        return 200
    }
    

    
    
    private struct Root: Decodable {
        let results: [Item]
        
        var feed: [FeedItem] {
            return  results.map { $0.item }

        }
    }


    private struct Item: Decodable {
         let id: UUID
         let title: String?
         let abstract: String?
         let url: URL
         let multimedia: [Multimedia]?
        
        var item: FeedItem {
            return FeedItem(id: id, title: title, abstract: abstract, storyURL: url, multimedia: multimedia)
        }
    }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        
        guard response.statusCode == OK_200,
              let root = try? JSONDecoder().decode(Root.self, from: data)
        else
        {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }
        
        return .success(root.feed)
        }
    }



