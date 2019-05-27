//
//  GitHubViewController.swift
//  MVPXCTest
//
//  Created by 横山新 on 2019/05/03.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import UIKit

final class GitHubViewController: UIViewController {
    
    private var presenter: GitHubPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func inject(presenter: GitHubPresenterInput) {
        self.presenter = presenter
        presenter.getRepository()
    }
    
    deinit {
        print("GitHubViewController: deinit")
    }
    
}

extension GitHubViewController: GitHubPresenterOutput {
    
    func setDataSource(repositories: [Repository]) {
        print(repositories)
        print(presenter.numberOfRepository)
    }
    
}
