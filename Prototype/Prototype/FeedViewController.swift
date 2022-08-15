//
//  FeedViewController.swift
//  Prototype
//
//  Created by Aymen Aifa on 15.08.22.
//

import UIKit

struct FeedImageViewModel {
    let title: String?
    let author: String?
    let imageName: String
}

final class FeedViewController: UITableViewController {
    private let feed = FeedImageViewModel.prototypeFeed

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedImageCell", for: indexPath) as! FeedImageCell
        let model = feed[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
}

extension FeedImageCell {
    func configure(with model: FeedImageViewModel) {
        title.text = model.title
        title.isHidden = model.title == nil
        
        author.text = model.author
        author.isHidden = model.author == nil
        
        fadeIn(UIImage(named: model.imageName))
    }
}

