//
//  AppNetworkManager.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 30.09.2022.
//

import UIKit

private enum Constants {
    static let baseURL = "https://newsapi.org/v2"
    static let method = "top-headlines"
    static let apiKey: String = {
        guard let apiKey = Bundle.main.infoDictionary?["apiKey"] as? String else { return "0x0003" }
        return apiKey
    }()
    static let country = "ru"
}

final class AppNetworkManager {
    
    static var shared = AppNetworkManager()
    
    private init() {}
    
    fileprivate func getBaseUrl(baseUrl: String, method: String, apiKey: String, country: String) -> String {
        return "\(baseUrl)/\(method)?country=\(country)&apiKey=\(apiKey)"
    }
    
    /// Get all news
    public func getTopHeadlines(comlition: @escaping (Result<[ArticleEntity], Error>) -> Void) {
        guard let url = URL(string: getBaseUrl(baseUrl: Constants.baseURL,
                                               method: Constants.method,
                                               apiKey: Constants.apiKey,
                                               country: Constants.country))
        else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                comlition(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(ArticleResponse.self, from: data)
                    comlition(.success(result.articles))
                }
                catch {
                    comlition(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    /// Get image in news
    public func getImageFromNews(url: String?, complition: @escaping (_ image: UIImage?) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            complition(UIImage(data: data))
        }
        
        task.resume()
    }
}
