//
//  Coordinator.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 04.10.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func startApp()
}
