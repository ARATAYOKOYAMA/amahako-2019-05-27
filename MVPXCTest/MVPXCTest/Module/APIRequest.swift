//
//  APIRequest.swift
//  MVPXCTest
//
//  Created by 横山新 on 2019/05/14.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation

protocol APIRequest {
    associatedtype Response // Responseの型
    var components: URLComponents { get } // pathやqueryはあるはず
    var parameters: String? { get } // POST等に使用するbodyはオプショナル
}

protocol APIClient {
    // 次はgenericsのお勉強だ
    func response<R: APIRequest>(from request: R, completion: @escaping (R.Response) -> ())
}
