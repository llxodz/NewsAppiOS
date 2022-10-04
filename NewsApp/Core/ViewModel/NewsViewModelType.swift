//
//  ViewModelType.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 04.10.2022.
//

import UIKit

protocol NewsViewModelType {
    var news: ArticleEntity? { get set }
    
    func getTitle() -> String
    func getDescription() -> String
    func getImageURL() -> String
}
