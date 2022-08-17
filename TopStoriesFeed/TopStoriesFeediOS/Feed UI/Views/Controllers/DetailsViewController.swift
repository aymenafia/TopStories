//
//  DetailsViewController.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 16.08.22.
//

import UIKit

protocol DetailsView: AnyObject { }

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var imageViewContainer: UIView!
    
    public var presenter: DetailsPresenter!
    @IBOutlet weak var secondContainer: UIStackView!
    
    @IBOutlet weak var detailsStackView: UIStackView!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyImageView.setImageAnimated(presenter.image())
        titleLabel.text = presenter.detailsTitle()
        descriptionLabel.text = presenter.description()
        authorLabel.text = presenter.author()
    }
    
    @IBAction func didTapOnReanMore(_ sender: Any) {
        presenter.showSeeMore(url: presenter.readMoreURL())
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if DeviceInfo.Orientation.isLandscape {
            detailsStackView.axis = .horizontal
        } else {
            detailsStackView.axis = .vertical
        }
    }
}

// MARK: - DetailsView
extension DetailsViewController: DetailsView { }

struct DeviceInfo {
    struct Orientation {
        // indicate current device is in the LandScape orientation
        static var isLandscape: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                ? UIDevice.current.orientation.isLandscape
                : UIApplication.shared.statusBarOrientation.isLandscape
            }
        }
        // indicate current device is in the Portrait orientation
        static var isPortrait: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                ? UIDevice.current.orientation.isPortrait
                : UIApplication.shared.statusBarOrientation.isPortrait
            }
        }
    }}
