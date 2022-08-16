//
//  DetailsViewController.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 16.08.22.
//

import UIKit

protocol DetailsView: AnyObject {
    func showLoading(_loading: Bool)
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var storyImageView: UIImageView!
    public var presenter: DetailsPresenter!
    @IBOutlet weak var detailsStackView: UIStackView!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        storyImageView.setImageAnimated(presenter.image())
        titleLabel.text = presenter.detailsTitle()
        descriptionLabel.text = presenter.description()
        authorLabel.text = presenter.author()

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapOnReanMore(_ sender: Any) {
        debugPrint("Hello Yosra")
        presenter.showSeeMore(url: presenter.readMoreURL())
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection:
    UITraitCollection?) {
        if view.traitCollection.verticalSizeClass == .compact {
            detailsStackView.axis = .horizontal
        } else {
            detailsStackView.axis = .vertical
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if UIDevice.current.orientation.isLandscape {
            detailsStackView.translatesAutoresizingMaskIntoConstraints = false

            detailsStackView.axis = .horizontal
            detailsStackView.updateConstraints()
            self.loadViewIfNeeded()
            self.updateViewConstraints()
            self.viewDidLayoutSubviews()
            detailsStackView.superview?.layoutIfNeeded()


        } else {
            detailsStackView.translatesAutoresizingMaskIntoConstraints = false
            detailsStackView.axis = .vertical
            detailsStackView.updateConstraints()
            self.loadViewIfNeeded()
            self.updateViewConstraints()
            self.viewDidLayoutSubviews()
            detailsStackView.superview?.layoutIfNeeded()

        }
    }
}

// MARK: - DetailsView
extension DetailsViewController: DetailsView {
    func showLoading(_loading: Bool) {
              
    }
    
    
}
