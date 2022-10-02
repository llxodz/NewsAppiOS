//
//  ArticleEntity.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 30.09.2022.
//

import UIKit

struct ArticleEntity: Codable {
    let source: SourceEntity
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}
