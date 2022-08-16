//
//  FeedUIComposer.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 15.08.22.
//

import UIKit
import TopStoriesFeed

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader:
                                                                    MainQueueDispatchDecorator(decoratee: feedLoader))
        
        let feedController = makeFeedViewController(
            delegate: presentationAdapter,
            title: FeedPresenter.title)
        
        presentationAdapter.presenter = FeedPresenter(
            feedView: FeedViewAdapter(
                controller: feedController,
                imageLoader: MainQueueDispatchDecorator(decoratee: imageLoader)),
            loadingView: WeakRefVirtualProxy(feedController),
            errorView: WeakRefVirtualProxy(feedController))
        
        return feedController
    }
    
    private static func makeFeedViewController(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.delegate = delegate
        feedController.title = title
        return feedController
    }
    
    static func makeDetailsViewController(feedImageViewModel: FeedImageViewModel<UIImage>) -> DetailsViewController {
        let bundle = Bundle(for: DetailsViewController.self)
        let storyboard = UIStoryboard(name: "Details", bundle: bundle)
        let detailsViewController = storyboard.instantiateInitialViewController() as! DetailsViewController
        let coordinator = DetailsDefaultRouter(viewController: detailsViewController)
        detailsViewController.presenter = DetailsDefaultPresenter(view: detailsViewController, router: coordinator, feedImageViewModel: feedImageViewModel)
        detailsViewController.title = feedImageViewModel.byline
        detailsViewController.loadViewIfNeeded()
        return detailsViewController
    }
    
    static func makeSeeMoreViewController(url: URL) -> SeeMoreController {
        let bundle = Bundle(for: SeeMoreController.self)
        let storyboard = UIStoryboard(name: "SeeMore", bundle: bundle)
        let seeMoreController = storyboard.instantiateInitialViewController() as! SeeMoreController
        seeMoreController.presenter = SeeMoreDefaultPresenter(view: seeMoreController, url: url)
        seeMoreController.loadViewIfNeeded()
        return seeMoreController
    }
}
