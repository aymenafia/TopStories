//
//  SceneDelegate.swift
//  TopStoriesApp
//
//  Created by Aymen Aifa on 16.08.22.
//

import UIKit
import TopStoriesFeed
import TopStoriesFeediOS

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.timeoutIntervalForRequest = TimeInterval(60)
        configuration.timeoutIntervalForResource = TimeInterval(60)
        
        let url = URL(string: "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=gllApBkPE1qOTEagTlgLrBNyu0L9qmwQ")!
        let session = URLSession(configuration: configuration)
        let client = URLSessionHTTPClient(session: session)
        let feedLoader = RemoteFeedLoader(url: url, client: client)
        let imageLoader = RemoteFeedImageDataLoader(client: client)
        let feedViewController = FeedUIComposer.feedComposedWith(feedLoader: feedLoader, imageLoader: imageLoader)
        URLCache.shared = URLCache(memoryCapacity: 1000 * 1024 * 1024,
                                   diskCapacity:   1000 * 1024 * 1024,
                                   diskPath:       nil)
        window?.rootViewController = UINavigationController(rootViewController: feedViewController)
        self.window?.makeKeyAndVisible()

    }

}

