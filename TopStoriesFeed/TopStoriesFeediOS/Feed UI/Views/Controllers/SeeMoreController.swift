//
//  SeeMoreController.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 16.08.22.
//

import UIKit
import WebKit

protocol SeeMoreView: AnyObject {
    func showLoading(_loading: Bool)
}

class SeeMoreController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    public var presenter: SeeMorePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
//        debugPrint(presenter.storyUrl())
        webView.delegate .self
        webView.loadRequest(URLRequest(url: presenter.storyUrl()))
        
  
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - DetailsView
    
extension SeeMoreController: SeeMoreView {
    func showLoading(_loading: Bool) {
        
    }
}
