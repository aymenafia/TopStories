//
//  DetailsRouter.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 16.08.22.
//

import Foundation

protocol DetailsRouter {
    func showSeeMore(url: URL)
}

final class DetailsDefaultRouter {
    
    fileprivate unowned let viewController: DetailsViewController
    
    init(viewController: DetailsViewController ) {
        self.viewController = viewController
    }
}

// MARK - DetailsDefaultRouter
extension DetailsDefaultRouter: DetailsRouter {
    func showSeeMore(url: URL) {
        let detailsVC = FeedUIComposer.makeSeeMoreViewController(url: url)
        self.viewController.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
