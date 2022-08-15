//
//  CodableFeedStore.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 14.08.22.
//

import Foundation
//
//public class CodableFeedStore: FeedStore {
//    private struct Cache: Codable {
//        let feed: [CodableFeedImage]
//        let timestamp: Date
//
//        var localFeed: [LocalFeedImage] {
//            return feed.map { $0.local }
//        }
//    }
//
//    private struct CodableFeedImage: Codable {
//        private let id: UUID
//        private let title: String?
//        private let abstract: String?
//        private let url: URL
//
//        init(_ image: LocalFeedImage) {
//            id = image.id
//            title = image.title
//            abstract = image.abstract
//            url = image.storyURL
//        }
//
//        var local: LocalFeedImage {
//            return LocalFeedImage(id: id, title: title, abstract: abstract, storyURL: url, multimedia: nil)
//        }
//    }
//
//    private let queue = DispatchQueue(label: "\(CodableFeedStore.self)Queue", qos: .userInitiated, attributes: .concurrent)
//    private let storeURL: URL
//
//    public init(storeURL: URL) {
//        self.storeURL = storeURL
//    }
//
//    public func retrieve(completion: @escaping RetrievalCompletion) {
//        let storeURL = self.storeURL
//        queue.async  {
//            guard let data = try? Data(contentsOf: storeURL) else {
//                return completion(.success(.empty))
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let cache = try decoder.decode(Cache.self, from: data)
//                completion(.success(.found(feed: cache.localFeed, timestamp: cache.timestamp)))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//    }
//
//    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
//        let storeURL = self.storeURL
//        queue.async(flags: .barrier) {
//        do {
//            let encoder = JSONEncoder()
//            let cache = Cache(feed: feed.map(CodableFeedImage.init), timestamp: timestamp)
//            let encoded = try encoder.encode(cache)
//            try encoded.write(to: storeURL)
//            completion(nil)
//        } catch {
//            completion(error)
//        }
//        }
//    }
//
//    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
//        let storeURL = self.storeURL
//        queue.async(flags: .barrier) {
//        guard FileManager.default.fileExists(atPath: storeURL.path) else {
//            return completion(nil)
//        }
//
//        do {
//            try FileManager.default.removeItem(at: storeURL)
//            completion(nil)
//        } catch {
//            completion(error)
//        }
//        }
//    }
//}
