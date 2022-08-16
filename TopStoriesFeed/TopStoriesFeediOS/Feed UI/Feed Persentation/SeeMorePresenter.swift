//
//  SeeMorePresenter.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 16.08.22.
//

import Foundation

protocol SeeMorePresenter {

    func storyUrl() -> URL
}

final class SeeMoreDefaultPresenter {
    
    fileprivate unowned let view: SeeMoreView
    fileprivate let url: URL

    
    init(view: SeeMoreView, url: URL) {
        self.view = view
        self.url = url
    }
}

// MARK: - DetailsDefaultPresenter
extension SeeMoreDefaultPresenter: SeeMorePresenter  {

    func storyUrl() -> URL {
        return  self.url
    }
}
