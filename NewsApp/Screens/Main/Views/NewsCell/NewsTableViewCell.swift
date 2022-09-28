//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 28.09.2022.
//

import UIKit
import SnapKit

final class NewsTableViewCell: UITableViewCell {
    
    // Public property
    public static var identifier: String {
        String(describing: self)
    }
    
    // UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    private lazy var newsImageView = UIImageView()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func addViews() {
        addSubviews(titleLabel, descriptionLabel, newsImageView)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.trailing.equalTo(newsImageView.snp.leading).offset(8)
            $0.bottom.equalTo(descriptionLabel.snp.top)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(newsImageView.snp.leading).inset(500)
            $0.top.equalTo(titleLabel.snp.bottom)
        }
        newsImageView.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.height.width.equalTo(100)
        }
    }
    
    private func configureAppearance() {
        
    }
}

extension NewsTableViewCell: Configurable {

    struct Model {
        let title: String
        let description: String
        let image: UIImage
    }

    func configure(with model: Model) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        newsImageView.image = model.image
    }
}
