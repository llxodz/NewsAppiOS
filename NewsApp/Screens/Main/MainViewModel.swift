//
//  MainViewModel.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 30.09.2022.
//

import UIKit

class MainViewModel {
     
    func getNews() -> [ArticleEntity]? {
        AppNetworkManager.shared.getTopHeadlines { [weak self] result in
            switch result {
                case .success(let result):
                    
                case .failure(let error):
                    print(error)
            }
        }
    }
}
