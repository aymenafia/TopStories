//
//  RemoteFeedLoaderTests.swift
//  TopStoriesFeedTests
//
//  Created by Aymen Aifa on 10.08.22.
//

import XCTest
import TopStoriesFeed


class RemoteFeedLoaderTests: XCTestCase {
    
    
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-GIVEN-url.com")!
        let (_, client) = makeSUT(url: url)
        XCTAssertTrue(client.requestedURLs.isEmpty)
    }
    
    func test_load_requestDataFromURL() {
        //Arrange: given a client and sut
        let url = URL(string: "https://a-GIVEN-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        XCTAssertEqual(client.requestedURLs, [url])
    }
    
    
    func test_load_deliversErrorOnClientError() {
        
        let (sut, client) = makeSUT()
        client.error = NSError(domain: "Test", code: 0)
        var capturedError: RemoteFeedLoader.Error?
        sut.load { error in capturedError = error }
        XCTAssertEqual(capturedError, .connectivity)

    }
    
    func test_loadTwice_requestDataFromURLTwice() {
        //Arrange: given a client and sut
        let url = URL(string: "https://a-GIVEN-url.com")!
        let (sut, client) = makeSUT(url: url)
        
        sut.load()
        sut.load()
        XCTAssertEqual(client.requestedURLs, [url, url])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-GIVEN-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    class HTTPClientSpy: HTTPClient {
        
        var requestedURLs = [URL]()
        var error: Error?
        
        func get(from url: URL, completion: @escaping (Error) -> Void) {
            if let error = error {
                completion(error)
            }
            requestedURLs.append(url)
        }
    }
}

