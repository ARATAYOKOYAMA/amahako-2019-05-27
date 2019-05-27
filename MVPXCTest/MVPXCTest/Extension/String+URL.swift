//
//  String+URL.swift
//  MVPXCTest
//
//  Created by 横山新 on 2019/05/04.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation

public extension String {
    var url: URL? {
        return URL(string: self)
    }
}

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        guard let url = URL(string: value) else {
            fatalError("\(value) is an invalid url")
        }
        self = url
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
}

