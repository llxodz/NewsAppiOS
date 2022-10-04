//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 04.10.2022.
//

import UIKit
import SnapKit

final class DetailViewController: BaseViewController {
    
    // Public property
    var viewModel: DetailViewModel? {
        didSet {
            titleNewsLabel.text = viewModel?.getTitle()
            descriptionNewsLabel.text = viewModel?.getDescription()
            AppNetworkManager.shared.getImageFromNews(url: viewModel?.getImageURL()) { image in
                DispatchQueue.main.async {
                    guard let image = image else { return }
                    self.newsImage.image = image
                }
            }
        }
    }
    weak var coordinator: AppCoordinator?
    
    // UI
    private lazy var newsImage = UIImageView()
    private lazy var titleNewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.mainBackgroundColor.color
        label.numberOfLines = 0
        label.font = FontFamily.Montserrat.bold.font(size: 16)
        return label
    }()
    private lazy var descriptionNewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.mainDescriptionColor.color
        label.numberOfLines = 0
        label.font = FontFamily.Montserrat.medium.font(size: 14)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    // MARK: - Private
    
    private func addViews() {
        view.addSubviews(newsImage, titleNewsLabel, descriptionNewsLabel)
    }
    
    private func configureLayout() {
        newsImage.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(200)
        }
        titleNewsLabel.snp.makeConstraints {
            $0.top.equalTo(newsImage.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        descriptionNewsLabel.snp.makeConstraints {
            $0.top.equalTo(titleNewsLabel.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func configureAppearance() {
        self.navigationController?.isNavigationBarHidden = false
        
        newsImage.layer.masksToBounds = true
        newsImage.layer.cornerRadius = CGFloat.baseRadius
    }
}

