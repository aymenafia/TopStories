//
//  DetailsPresenter.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 16.08.22.
//

import Foundation
import UIKit

protocol DetailsPresenter {
    
    func showSeeMore(url: URL)
    
    func detailsTitle() -> String?
    func image() -> UIImage?
    func author() -> String
    func description() -> String
    func readMoreURL() -> URL
}

final class DetailsDefaultPresenter {
    
    
    fileprivate unowned let view: DetailsView
    fileprivate let router: DetailsRouter
    fileprivate let feedImageViewModel: FeedImageViewModel<UIImage>
    
    
    init(view: DetailsView, router: DetailsRouter, feedImageViewModel: FeedImageViewModel<UIImage>) {
        self.view = view
        self.router = router
        self.feedImageViewModel = feedImageViewModel
    }
}

// MARK: - DetailsDefaultPresenter
extension DetailsDefaultPresenter: DetailsPresenter  {
    func showSeeMore(url: URL) {
        router.showSeeMore(url: url)
    }
    
    
    func readMoreURL() -> URL {
        return  feedImageViewModel.url
    }
    
    func author() -> String {
        feedImageViewModel.byline ?? ""
    }
    
    func description() -> String {
        feedImageViewModel.abstract  ?? ""
        
    }
    
    func image() -> UIImage? {
        return feedImageViewModel.image
    }
    
    func detailsTitle() -> String? {
        return feedImageViewModel.title 
    }
    
    
}
