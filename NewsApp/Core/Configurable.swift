//
//  Configurable.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 29.09.2022.
//

import Foundation

public protocol Configurable: AnyObject {
    
    associatedtype Model
    
    func configure<T>(with model: T)
}
