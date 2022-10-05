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
            return "\(L10n.Detail.author): \(news?.author ?? "")"
        } else {
            return L10n.Detail.notAuthor
        }
    }
    
    func getTextToShare() -> String {
        if let title = news?.title,
           let description = self.news?.description,
           let url = self.news?.url
        {
            return "\(title)\n\n\(description)\n\n\(getAuthorNews())\n\n\(url)"
        } else {
            return ""
        }
    }
}
