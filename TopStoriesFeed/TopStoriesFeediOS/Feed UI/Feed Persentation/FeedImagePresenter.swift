//
//  FeedImageViewModel.swift
//  TopStoriesFeediOS
//
//  Created by Aymen Aifa on 15.08.22.
//

import Foundation
import TopStoriesFeed

protocol FeedImageView {
    associatedtype Image
    
    func display(_ model: FeedImageViewModel<Image>)
}

final class FeedImagePresenter<View: FeedImageView, Image> where View.Image == Image {
    private let view: View
    private let imageTransformer: (Data) -> Image?
    
    internal init(view: View, imageTransformer: @escaping (Data) -> Image?) {
        self.view = view
        self.imageTransformer = imageTransformer
    }
    
    func didStartLoadingImageData(for model: FeedImage) {
        view.display(FeedImageViewModel(
            title: model.title,
            abstract: model.abstract, byline: model.byline, url: model.url,
            image: nil,
            isLoading: true,
            shouldRetry: false))
    }
    
    private struct InvalidImageDataError: Error {}
    
    func didFinishLoadingImageData(with data: Data, for model: FeedImage) {
        guard let image = imageTransformer(data) else {
            return didFinishLoadingImageData(with: InvalidImageDataError(), for: model)
        }
        
        view.display(FeedImageViewModel(
            title: model.title,
            abstract: model.abstract,
            byline: model.byline,
            url: model.url,
            image: image,
            isLoading: false,
            shouldRetry: false))
    }
    
    func didFinishLoadingImageData(with error: Error, for model: FeedImage) {
        view.display(FeedImageViewModel(
            title: model.title,
            abstract: model.abstract,
            byline: model.byline,
            url:  model.url,
            image: nil,
            isLoading: false,
            shouldRetry: true))
    }
}
