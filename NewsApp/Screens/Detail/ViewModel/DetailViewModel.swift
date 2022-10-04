//
//  DetailViewModel.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 04.10.2022.
//

import UIKit

class DetailViewModel {
    
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
    
    func getAuthorNews() -> String {
        if ((news?.author) != nil) {
            return "Автор: \(news?.author ?? "")"
        } else {
            return "Автор не указан"
        }
    }
}
