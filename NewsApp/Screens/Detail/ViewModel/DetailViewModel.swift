//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 04.10.2022.
//

import UIKit

class DetailViewModel: NewsViewModelType {
    
    var news: ArticleEntity?
    
    init(news: ArticleEntity?) {
        self.news = news
    }
    
    func getTitle() -> String {
        return news?.title ?? ""
    }
    
    func getDescription() -> String {
        return news?.description ?? ""
    }
    
    func getImageURL() -> String {
        return news?.urlToImage ?? ""
    }
}
