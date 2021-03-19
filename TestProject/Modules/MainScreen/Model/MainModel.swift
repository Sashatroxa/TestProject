//
//  MainModel.swift
//  TestProject
//
//  Created by Александр on 15.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

// MARK: - MainModel
struct MainModel: Codable {
    let content: [Content]
}

// MARK: - Data
struct Content: Codable {
    let texts: [String]?
    let sectionTitle: String?
    let images: [String]?
}
