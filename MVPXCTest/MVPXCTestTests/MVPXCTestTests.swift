//
//  MVPXCTestTests.swift
//  MVPXCTestTests
//
//  Created by 横山新 on 2019/05/03.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import XCTest
@testable import MVPXCTest

class MVPXCTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGitHubRepository() {
        struct MockAPIReqest: APIRequest {
            var components: URLComponents
            var parameters: String?
            typealias Response = [Repository]
        }
        
        class MockAPIClient: APIClient {
            func response<R>(from request: R, completion: @escaping (R.Response) -> ()) where R : APIRequest {
                let mock = Repository(id: 1, name: "test")
                completion([mock] as! R.Response)
            }
        }
        
        let apiClient = MockAPIClient()
        let model = GitHubModel(githubAPIClient: apiClient)
        model.getRepository(userName: "") { repository in
            XCTAssertEqual(repository.first?.name, "test")
        }
    }

}
