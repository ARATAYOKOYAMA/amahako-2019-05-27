//
//  GitHubModel.swift
//  MVPXCTest
//
//  Created by 横山新 on 2019/05/03.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation

// modelは完全独立しており，単体でbuildできるべき
protocol GitHubModelInput: class {
    func getRepository(userName: String, completion: @escaping ([Repository]) -> ())
}

final class GitHubModel: GitHubModelInput {
    private let apiClient: APIClient
    
    init(githubAPIClient: APIClient) {
        self.apiClient = githubAPIClient
    }
    
    func getRepository(userName: String, completion: @escaping ([Repository]) -> ()) {
        let apiRequest = GitHubRequest(userName: userName)
        apiClient.response(from: apiRequest, completion: { repositories in
            completion(repositories)
        })
    }
    
    deinit {
        print("GitHubModel: deinit")
    }
}
