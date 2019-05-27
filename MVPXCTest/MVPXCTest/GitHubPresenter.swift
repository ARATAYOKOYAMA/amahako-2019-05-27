//
//  GitHubPresenter.swift
//  MVPXCTest
//
//  Created by 横山新 on 2019/05/03.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation

protocol GitHubPresenterInput: class {
    var numberOfRepository: Int { get }
    func repository(at index: Int) -> Repository?
    func getRepository()
}

protocol GitHubPresenterOutput: class {
    func setDataSource(repositories: [Repository])
}

final class GitHubPresenter: GitHubPresenterInput {

    private weak var view: GitHubPresenterOutput?
    private var repositories: [Repository] = []
    private var model: GitHubModelInput!

    init(view: GitHubPresenterOutput, model: GitHubModelInput) {
        self.view = view
        self.model = model
    }

    var numberOfRepository: Int {
        get {
            return repositories.count
        }
    }

    func repository(at index: Int) -> Repository? {
        guard index < repositories.count else { return nil }
        return repositories[index]
    }

    func getRepository() {
        model.getRepository(userName: "ARATAYOKOYAMA", completion: { [weak self] repositories in
            guard let _ = self else { return }
            self!.repositories = repositories
            self!.view?.setDataSource(repositories: repositories)
        })
    }
    
    deinit {
        print("GitHubPresenter: deinit")
    }

}
