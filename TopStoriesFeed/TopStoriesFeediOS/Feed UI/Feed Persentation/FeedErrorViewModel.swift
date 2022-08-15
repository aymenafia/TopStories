//
//  FeedErrorViewModel.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 16.08.22.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
