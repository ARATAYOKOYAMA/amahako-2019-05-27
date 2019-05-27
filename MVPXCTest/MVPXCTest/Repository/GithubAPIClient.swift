//
//  GithubAPIClient.swift
//  MVPXCTest
//
//  Created by 横山新 on 2019/05/14.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation

final class GithubAPIClient: APIClient {
    private var _state: loadStatus = .initial
    var state: loadStatus {
        get {
            return _state
        }
    }
    
    deinit {
        print("GithubAPIClient: deinit")
    }

    func response<R : APIRequest>(from request: R, completion: @escaping (R.Response) -> ()) {
        guard _state != .fetching else { return }
        _state = .fetching
        let api = ApiManager(method: .get, components: request.components)
        api.request(
            success: { [weak self] (data: Data) in
                guard let _ = self else { return }
                do {
                    let repositories = try JSONDecoder().decode([Repository].self, from: data)
                    self!._state = .success
                    completion(repositories as! R.Response)
                } catch {
                    self!._state = .initial
                }
            }, fail: { [weak self] (error: Error?) in
                guard let _ = self else { return }
                self!._state = .fail
                print(error)
            }
        )
    }
}
