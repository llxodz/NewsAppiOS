//
//  HeaderMainView.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 28.09.2022.
//

import UIKit
import SnapKit

private enum Constants {
    static let titleFont: UIFont = FontFamily.Montserrat.medium.font(size: 16)
    static let separatorHeight: CGFloat = 0.5
}

final class HeaderMainView: UIView {
    
    // UI
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.breakingsNews
        label.font = Constants.titleFont
        label.textColor = Asset.mainBackgroundColor.color
        return label
    }()
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func addViews() {
        addSubviews(titleLabel, separatorView)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints {
                    $0.center.equalToSuperview()
                }
        separatorView.snp.makeConstraints {
            $0.height.equalTo(Constants.separatorHeight)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureAppearance() {
        backgroundColor = .white
    }
}
