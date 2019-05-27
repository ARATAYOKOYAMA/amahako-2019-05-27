//
//  GitHubRequest.swift
//  MVPXCTest
//
//  Created by 横山新 on 2019/05/14.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation

struct Repository: Codable {
    let id: Int
    let name: String
}


struct GitHubRequest: APIRequest {
    private var _components = URLComponents()
    typealias Response = [Repository]
    var components: URLComponents {
        return _components
    }
    var parameters: String? {
        return nil
    }
    
    init(userName: String) {
        self._components.scheme = "https"
        self._components.host = "api.github.com"
        self._components.path = "/users/\(userName)/repos"
    }
}
