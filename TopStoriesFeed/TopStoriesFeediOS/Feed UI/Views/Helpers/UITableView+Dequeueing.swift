//
//  UITableView+Dequeueing.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 15.08.22.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
