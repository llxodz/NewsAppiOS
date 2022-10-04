//
//  AppCoordinator.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 04.10.2022.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startApp() {
        let vc = MainViewController()
        vc.coordinator = self
        vc.viewModel = MainViewModel()
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showDetailViewController(_ viewModel: DetailViewModel?) {
        let vc = DetailViewController()
        vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.navigationBar.isHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
}
