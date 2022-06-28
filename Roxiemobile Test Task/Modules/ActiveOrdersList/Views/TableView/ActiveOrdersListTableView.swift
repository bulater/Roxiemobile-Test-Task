//
//  ActiveOrdersListTableView.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

protocol ActiveOrdersListTableViewDataSourceDelegate: AnyObject {

}

class ActiveOrdersListTableView: UITableView {
    // MARK: - Public Properties

    weak var dataSourceDelegate: ActiveOrdersListTableViewDataSourceDelegate?

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

}

// MARK: - UITableViewDataSource

extension ActiveOrdersListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = ActiveOrdersListTableViewCell.cellID
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ActiveOrdersListTableViewCell
        else {
            return UITableViewCell() }

        return cell
    }
}
