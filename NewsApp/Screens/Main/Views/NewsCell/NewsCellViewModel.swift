//
//  NewsCellViewModel.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 30.09.2022.
//

import UIKit

class NewsCellViewModel {
    
    private var news: ArticleEntity?
    
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
