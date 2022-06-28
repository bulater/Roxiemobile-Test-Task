//
//  ActiveOrdersListView.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

protocol ActiveOrdersListViewDelegate: AnyObject {
}

class ActiveOrdersListView: UIView {
    // MARK: - Public Properties

    weak var delegate: ActiveOrdersListViewDelegate?

    // MARK: - Private Properties

    lazy var activeOrdersListTableView: ActiveOrdersListTableView = { ActiveOrdersListView.makeActiveOrdersListTableView(self) }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        addSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Creating Subviews

    func addSubviews() {
        addSubview(activeOrdersListTableView)
        activateActiveOrdersListTableViewConstraints()
    }

    static func makeActiveOrdersListTableView(_ delegate: ActiveOrdersListTableViewDataSourceDelegate) -> ActiveOrdersListTableView {
        let tableView = ActiveOrdersListTableView(frame: .zero, style: .grouped)
        tableView.dataSourceDelegate = delegate
        tableView.backgroundColor = .white
        tableView.register(ActiveOrdersListTableViewCell.self, forCellReuseIdentifier: ActiveOrdersListTableViewCell.cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }

    // MARK: - Public Methods

    private func configureView() {
        backgroundColor = .white
    }

    // MARK: - Private Methods


    // MARK: - Layout

    private func activateActiveOrdersListTableViewConstraints() {
        NSLayoutConstraint.activate([
            activeOrdersListTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            activeOrdersListTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            activeOrdersListTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            activeOrdersListTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - ActiveOrdersListTableViewDataSourceDelegate

extension ActiveOrdersListView: ActiveOrdersListTableViewDataSourceDelegate {

}
