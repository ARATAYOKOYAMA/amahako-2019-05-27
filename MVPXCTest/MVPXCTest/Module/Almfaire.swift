//
//  Almfaire.swift
//  MVPXCTest
//
//  Created by 横山新 on 2019/05/03.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//
import Foundation
import Alamofire

enum loadStatus {
    case initial
    case fetching
    case success
    case fail
}

struct ApiManager {

    private let method: HTTPMethod
    private let parameters: Parameters?
    private let components: URLComponents

    init(method: HTTPMethod = .get, components: URLComponents = URLComponents(), parameters: Parameters = [:]) {
        self.method = method
        self.components = components
        guard parameters.count != 0 else {
            // 確かget時はnilじゃないとコケる
            self.parameters = nil
            return
        }
        self.parameters = parameters
    }

    func request(success: @escaping (_ data: Data) -> (), fail: @escaping (_ error: Error?) -> ()) {
        guard let url = components.url else { return }
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                success(data)
            case .failure(let error):
                fail(error)
            }
        }
    }

}

