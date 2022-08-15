//
//  FeedImageCellController.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 15.08.22.
//

import UIKit
import TopStoriesFeed

final class FeedImageCellController {
    private var task: FeedImageDataLoaderTask?
    private let model: FeedImage
    private let imageLoader: FeedImageDataLoader
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader) {
        self.model = model
        self.imageLoader = imageLoader
    }
    
    func view() -> UITableViewCell {
        let cell = FeedImageCell()
        cell.titleContainer.isHidden = (model.title == nil)
        cell.titleLabel.text = model.title
        cell.authorLabel.text = model.abstract
        cell.feedImageView.image = nil
        cell.feedImageRetryButton.isHidden = true
        cell.feedImageContainer.startShimmering()
        
        let loadImage = { [weak self, weak cell] in
            guard let self = self else { return }
            if let url = self.model.multimedia?.first?.url {
                
                self.task = self.imageLoader.loadImageData(from: url) { [weak cell] result in
                    let data = try? result.get()
                    let image = data.map(UIImage.init) ?? nil
                    cell?.feedImageView.image = image
                    cell?.feedImageRetryButton.isHidden = (image != nil)
                    cell?.feedImageContainer.stopShimmering()
                }
                
            }
            
        }
        
        cell.onRetry = loadImage
        loadImage()
        
        return cell
    }
    
    func preload() {
        if let url = self.model.multimedia?.first?.url {
            
            task = imageLoader.loadImageData(from: url) { _ in }
            
        }
    }
    
    func cancelLoad() {
        task?.cancel()
    }
}
