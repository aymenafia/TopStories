//
//  FeedImageCellController.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 15.08.22.
//

import UIKit

protocol FeedImageCellControllerDelegate {
    func didRequestImage()
    func didCancelImageRequest()
}

final class FeedImageCellController: FeedImageView {
    private let delegate: FeedImageCellControllerDelegate
    private var cell: FeedImageCell?
    var vm: FeedImageViewModel<UIImage>?
    init(delegate: FeedImageCellControllerDelegate) {
        self.delegate = delegate
    }
    
    func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        delegate.didRequestImage()
        return cell!
    }
    
    func preload() {
        delegate.didRequestImage()
    }
    
    func cancelLoad() {
        releaseCellForReuse()
        delegate.didCancelImageRequest()
    }
    
    func display(_ viewModel: FeedImageViewModel<UIImage>) {
        vm = viewModel
        cell?.titleContainer.isHidden = !viewModel.hasaTitle
        cell?.titleLabel.text = viewModel.title
        cell?.authorLabel.text = viewModel.byline
        cell?.feedImageView.setImageAnimated(viewModel.image)
        cell?.feedImageContainer.isShimmering = viewModel.isLoading
        cell?.feedImageRetryButton.isHidden = !viewModel.shouldRetry
        cell?.onRetry = delegate.didRequestImage
    }
    
    func selected() {
        debugPrint(vm?.title)
        debugPrint(vm?.byline)
        debugPrint(vm?.image)

        debugPrint(vm?.url)

    }
    
    private func releaseCellForReuse() {
        cell = nil
    }
}
