//
//  FeedImageViewModel+PrototypeData.swift
//  Prototype
//
//  Created by Aymen Aifa on 15.08.22.
//

import Foundation

extension FeedImageViewModel {
    static var prototypeFeed: [FeedImageViewModel] {
        return [
            FeedImageViewModel(
                title: "The East Side Gallerk.",
                author: "East Side Gallery\nMemorial in Berlin, Germany",
                imageName: "image-0"
            ),
            FeedImageViewModel(
                title: nil,
                author: "Cannon Street, London",
                imageName: "image-1"
            ),
            FeedImageViewModel(
                title: "The Desert Island in Faro is beautiful!! ☀️",
                author: nil,
                imageName: "image-2"
            ),
            FeedImageViewModel(
                title: nil,
                author: nil,
                imageName: "image-3"
            ),
            FeedImageViewModel(
                title: "Garth Pi in the British Isles.",
                author: "Garth Pier\nNorth Wales",
                imageName: "image-4"
            ),
            FeedImageViewModel(
                title: "Glorious day in Brighton!! 🎢",
                author: "Brighton Seafront",
                imageName: "image-5"
            )
        ]
    }
}
