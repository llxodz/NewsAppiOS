//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 04.10.2022.
//

import UIKit
import SnapKit
import Kingfisher

private enum Constants {
    static let titleFont: UIFont = FontFamily.Montserrat.bold.font(size: 16)
    static let descriptionFont: UIFont = FontFamily.Montserrat.medium.font(size: 14)
    static let authorFont: UIFont = FontFamily.Montserrat.regular.font(size: 16)
    
    static let imageHeight: CGFloat = 208
    static let separatorHeight: CGFloat = 0.5
    
    static let heightButton: CGFloat = 56
    static let selectedAlpha: CGFloat = 0.3
    static let whiteSelected: CGFloat = 0.5
}

final class DetailViewController: BaseViewController {
    
    // Public property
    var viewModel: DetailViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleNewsLabel.text = viewModel.getTitle()
            descriptionNewsLabel.text = viewModel.getDescription()
            authorLabel.text = viewModel.getAuthorNews()
            let url = URL(string: viewModel.getImageURL())
            newsImage.kf.setImage(with: url)
        }
    }
    weak var coordinator: AppCoordinator?
    
    // UI
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    private lazy var newsImage = UIImageView()
    private lazy var titleNewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.mainBackgroundColor.color
        label.numberOfLines = 0
        label.font = Constants.titleFont
        return label
    }()
    private lazy var descriptionNewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.mainDescriptionColor.color
        label.numberOfLines = 0
        label.font = Constants.descriptionFont
        return label
    }()
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = Asset.mainBackgroundColor.color
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = Constants.authorFont
        return label
    }()
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = .baseRadius
        button.layer.masksToBounds = true
        button.setTitle(L10n.Detail.shareButton, for: .normal)
        button.titleLabel?.font = Constants.titleFont
        button.setTitleColor(Asset.mainBackgroundColor.color, for: .normal)
        button.setTitleColor(UIColor.init(
            white: Constants.whiteSelected,
            alpha: Constants.selectedAlpha),
            for: .highlighted
        )
        button.backgroundColor = Asset.detailButtonBackground.color
        button.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        return button
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
        view.addSubviews(separatorView,
                         newsImage,
                         titleNewsLabel,
                         descriptionNewsLabel,
                         authorLabel,
                         shareButton)
    }
    
    private func configureLayout() {
        separatorView.snp.makeConstraints {
            $0.height.equalTo(Constants.separatorHeight)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        newsImage.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.trailing.equalToSuperview().inset(CGFloat.baseMargin)
            $0.height.equalTo(Constants.imageHeight)
        }
        titleNewsLabel.snp.makeConstraints {
            $0.top.equalTo(newsImage.snp.bottom).offset(CGFloat.baseMargin)
            $0.leading.trailing.equalToSuperview().inset(CGFloat.baseMargin)
        }
        descriptionNewsLabel.snp.makeConstraints {
            $0.top.equalTo(titleNewsLabel.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.trailing.equalToSuperview().inset(CGFloat.baseMargin)
        }
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionNewsLabel.snp.bottom).offset(CGFloat.compactMargin)
            $0.leading.trailing.equalToSuperview().inset(CGFloat.baseMargin)
        }
        shareButton.snp.makeConstraints {
            $0.height.equalTo(Constants.heightButton)
            $0.trailing.leading.equalToSuperview().inset(CGFloat.baseMargin)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(CGFloat.baseMargin)
        }
    }
    
    private func configureAppearance() {
        self.navigationController?.isNavigationBarHidden = false
        
        newsImage.layer.masksToBounds = true
        newsImage.layer.cornerRadius = CGFloat.baseRadius
    }
    
    @objc private func shareButtonTapped() {
        let textToShare = [viewModel?.getTextToShare()]
        let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.airDrop,
                                                        UIActivity.ActivityType.postToFacebook]
        self.present(activityViewController, animated: true, completion: nil)
    }
}

