//
//  HTTPClient.swift
//  TopStoriesFeed
//
//  Created by Aymen Aifa on 13.08.22.
//

import Foundation



public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    func get(from url: URL, completion: @escaping (Result) -> Void)
}
