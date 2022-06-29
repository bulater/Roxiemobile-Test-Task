//
//  ActiveOrdersListTableView.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

protocol ActiveOrdersListTableViewCustomDelegate: AnyObject {
    func activeOrdersListTableViewGetCellsCount(_ activeOrdersListTableView: ActiveOrdersListTableView) -> Int?
    func activeOrdersListTableView(_ activeOrdersListTableView: ActiveOrdersListTableView, getOrderAt index: Int) -> ActiveOrdersViewModel?
    func activeOrdersListTableView(_ activeOrdersListTableView: ActiveOrdersListTableView, didSelectOrderAt index: Int)
}

class ActiveOrdersListTableView: UITableView {
    // MARK: - Public Properties

    weak var customDelegate: ActiveOrdersListTableViewCustomDelegate?

    // MARK: - Init

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDelegate

extension ActiveOrdersListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        customDelegate?.activeOrdersListTableView(self, didSelectOrderAt: indexPath.row)
    }
}

// MARK: - UITableViewDataSource

extension ActiveOrdersListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customDelegate?.activeOrdersListTableViewGetCellsCount(self) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = ActiveOrdersListTableViewCell.cellID
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ActiveOrdersListTableViewCell
        else {
            return UITableViewCell() }

        let orderViewModel = customDelegate?.activeOrdersListTableView(self, getOrderAt: indexPath.row)
        cell.configure(with: orderViewModel)

        return cell
    }
}
