//
//  MainViewModel.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 30.09.2022.
//

import UIKit

class MainViewModel {
    
    private var news: [ArticleEntity]?
     
    func fetchNews(complition: @escaping () -> Void) {
        AppNetworkManager.shared.getTopHeadlines { [weak self] result in
            switch result {
                case .success(let result):
                    self?.news = result
                    complition()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int? {
        return news?.count ?? 0
    }
    
    func getNews() -> [ArticleEntity]? {
        return self.news
    }
    
    func getViewModelCell(forIndexPath: IndexPath) -> NewsCellViewModel? {
        let news = news?[forIndexPath.row]
        return NewsCellViewModel(news: news)
    }
    
    func selectedRow(forIndexPath: IndexPath) -> DetailViewModel? {
        let news = news?[forIndexPath.row]
        return DetailViewModel(news: news)
    }
}
