//
//  ActiveOrdersListView.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

protocol ActiveOrdersListViewDelegate: AnyObject {
    func activeOrdersListViewGetCellsCount(_ activeOrdersListView: ActiveOrdersListView) -> Int?
    func activeOrdersListView(_ activeOrdersListView: ActiveOrdersListView, getOrderAt index: Int) -> ActiveOrdersViewModel?
    func activeOrdersListView(_ activeOrdersListView: ActiveOrdersListView, didSelectOrderAt index: Int)
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

    // MARK: - Private Methods

    private func configureView() {
        backgroundColor = .white
    }

    // MARK: - Creating Subviews

    func addSubviews() {
        addSubview(activeOrdersListTableView)
        activateActiveOrdersListTableViewConstraints()
    }

    static func makeActiveOrdersListTableView(_ delegate: ActiveOrdersListTableViewCustomDelegate) -> ActiveOrdersListTableView {
        let tableView = ActiveOrdersListTableView(frame: .zero, style: .grouped)
        tableView.customDelegate = delegate
        tableView.backgroundColor = .white
        tableView.register(ActiveOrdersListTableViewCell.self, forCellReuseIdentifier: ActiveOrdersListTableViewCell.cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }

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

extension ActiveOrdersListView: ActiveOrdersListTableViewCustomDelegate {
    func activeOrdersListTableView(_ activeOrdersListTableView: ActiveOrdersListTableView, didSelectOrderAt index: Int) {
        delegate?.activeOrdersListView(self, didSelectOrderAt: index)
    }

    func activeOrdersListTableViewGetCellsCount(_ activeOrdersListTableView: ActiveOrdersListTableView) -> Int? {
        delegate?.activeOrdersListViewGetCellsCount(self)
    }

    func activeOrdersListTableView(_ activeOrdersListTableView: ActiveOrdersListTableView, getOrderAt index: Int) -> ActiveOrdersViewModel? {
        delegate?.activeOrdersListView(self, getOrderAt: index)
    }
}
