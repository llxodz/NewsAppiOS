//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 28.09.2022.
//

import UIKit
import SnapKit

private enum Constants {
    static let titleLabelFont: UIFont = FontFamily.Montserrat.bold.font(size: 16)
    static let descriptionLabelFont: UIFont = FontFamily.Montserrat.regular.font(size: 12)
    
    static let imageSize: CGFloat = 108
    static let numbersOfLines: Int = 4
}

final class NewsTableViewCell: UITableViewCell {
    
    // Public property
    public static var identifier: String {
        String(describing: self)
    }
    
    weak var viewModel: NewsCellViewModel? {
        didSet {
            titleLabel.text = viewModel?.getTitle()
            descriptionLabel.text = viewModel?.getDescription()
            AppNetworkManager.shared.getImageFromNews(url: viewModel?.getImageURL()) { image in
                DispatchQueue.main.async {
                    guard let image = image else { return }
                    self.newsImageView.image = image
                }
            }
        }
    }
    
    // UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.numbersOfLines / 2
        label.font = Constants.titleLabelFont
        label.textColor = Asset.mainBackgroundColor.color
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.numbersOfLines
        label.textColor = Asset.mainDescriptionColor.color
        label.font = Constants.descriptionLabelFont
        return label
    }()
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = CGFloat.compactRadius
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureLayout()
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
            $0.leading.top.equalToSuperview().offset(CGFloat.smallMargin)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.equalToSuperview().offset(CGFloat.smallMargin)
        }
        newsImageView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.imageSize)
            $0.trailing.equalTo(self.snp.trailing).inset(CGFloat.smallMargin)
            $0.centerY.equalTo(self.snp.centerY).inset(CGFloat.smallMargin)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(CGFloat.smallMargin)
            $0.leading.equalTo(descriptionLabel.snp.trailing).offset(CGFloat.smallMargin)
        }
    }
}
