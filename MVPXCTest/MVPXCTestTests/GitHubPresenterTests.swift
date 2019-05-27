//
//  GitHubPresenterTests.swift
//  MVPXCTestTests
//
//  Created by 横山新 on 2019/05/04.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import XCTest
@testable import MVPXCTest

class GitHubPresenterTests: XCTestCase {

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

    func testPresenter() {

        class GitHubViewControllerSpy: GitHubPresenterOutput {
            func setDataSource(repositories: [Repository]) {
                print(repositories)
                XCTAssertNotNil(repositories)
            }
        }

        class GitHubModelSpy: GitHubModelInput {
            private let mockRepository: [Repository] = [Repository(id: 1, name: "hoge")]
            func getRepository(userName: String, completion: @escaping ([Repository]) -> ()) {
                completion(self.mockRepository)
            }
        }
        
        let gitHubViewControllerSpy = GitHubViewControllerSpy()
        let gitHubModelSpy = GitHubModelSpy()
        let presenter = GitHubPresenter(view: gitHubViewControllerSpy, model: gitHubModelSpy)
        presenter.getRepository()
    }

}
