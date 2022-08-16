//
//  FeedImageViewModel.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 15.08.22.
//

import Foundation

struct FeedImageViewModel<Image> {
    let title: String?
    let abstract: String?
    let byline: String?
    let url: URL
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasaTitle: Bool {
        return title != nil
    }
}
