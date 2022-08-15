//
//  UIRefreshControl+Helpers.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 16.08.22.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
