//
//  FeedImageCell.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 15.08.22.
//

import UIKit

public final class FeedImageCell: UITableViewCell {
    @IBOutlet private(set) public var titleContainer: UIStackView!
    @IBOutlet private(set) public var titleLabel: UILabel!
    @IBOutlet private(set) public var authorLabel: UILabel!
    
    @IBOutlet private(set) public var feedImageContainer: UIView!
    
    @IBOutlet private(set) public var feedImageView: UIImageView!
    
    var onRetry: (() -> Void)?
    
    @IBOutlet private(set) public var feedImageRetryButton: UIButton!

    @IBAction private func retryButtonTapped() {
        onRetry?()
    }
}
