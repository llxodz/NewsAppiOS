//
//  ViewController.swift
//  NewsApp
//
//  Created by Ilya Gavrilov on 28.09.2022.
//

import UIKit
import SnapKit

private enum Constants {
    static let headerHeight: CGFloat = 44
    static let rowHeight: CGFloat = 108
    
    static let image: UIImage = Asset.armenia.image
}

final class MainViewController: BaseViewController {
    
    // UI
    private lazy var headerView = HeaderMainView()
    private lazy var tableView = UITableView()
    
    private var viewModel: MainViewModel?
    
    private let models: [NewsTableViewCell.Model] = [
        NewsTableViewCell.Model(title: "dadasdasdasdasdssbdsbdansdbnsbnabdnasbdnasdbsndbdnasbanbsanbdansdbasnd", description: "hdhasgdhashjdjhdsjhjsdgdhasgdajhjdsjhdajdhsaajsdhjadasdasdsadhasjdhjasdjadshajdhskjdahdjkashdjaksdhsdjasdhajsdjashjasdjashsadhdghsh", image: Constants.image),
        NewsTableViewCell.Model(title: "dadasdasdasdasd", description: "hdhasghdshsdhdhasgdhasgdahdghsh", image: Constants.image),
        NewsTableViewCell.Model(title: "dadasdasdasdasd", description: "hdhasdsdgdhasgdhasgdahdghsh", image: Constants.image),
        NewsTableViewCell.Model(title: "dadasdasdasdasd", description: "hdhasssdsdshshjdhjsdhsjdsdsgdhasgdhasgdahdghsh", image: Constants.image),
        NewsTableViewCell.Model(title: "dadasdasdasdasd", description: "hdhasgdhasgdhasgdsdjhsdhjjhsdhsdjahdghsh", image: Constants.image),
        NewsTableViewCell.Model(title: "dadasdasdasdasd", description: "hdhasgdhasgdhahhjjhjhsgdahdghsh", image: Constants.image)
    ]
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addSubviews()
        configureLayout()
        configureAppearance()
        configureTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureViewModel()
    }
    
    // MARK: - Private
    
    private func addSubviews() {
        view.addSubviews(headerView, tableView)
    }
    
    private func configureLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constants.headerHeight)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureAppearance() {
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0.001, height: 0))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0.001, height: 0))
        tableView.separatorInset = UIEdgeInsets(top: 0, left: .baseMargin, bottom: 0, right: 0)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.delaysContentTouches = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.rowHeight = Constants.rowHeight
    }
    
    private func configureViewModel() {
        viewModel = MainViewModel()
        viewModel?.fetchNews {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - Extensions UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.numberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsTableViewCell.identifier,
            for: indexPath
        ) as? NewsTableViewCell, let news = viewModel?.getNews() else { return UITableViewCell() }
        print(news)
        cell.configure(with: news[indexPath.row])
        
        return cell
    }
}
