//
//  OrderDetailTableView.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

protocol OrderDetailTableViewCustomDelegate: AnyObject {
    func orderDetailTableViewGetOrder(_ orderDetailTableView: OrderDetailTableView) -> ActiveOrdersViewModel?
}

class OrderDetailTableView: UITableView {
    // MARK: - Public Properties

    weak var customDelegate: OrderDetailTableViewCustomDelegate?

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

extension OrderDetailTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return superview?.frame.height ?? 0
    }
}

// MARK: - UITableViewDataSource

extension OrderDetailTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = OrderDetailTableViewCell.cellID
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? OrderDetailTableViewCell
        else {
            return UITableViewCell() }

        let orderViewModel = customDelegate?.orderDetailTableViewGetOrder(self)
        cell.configure(with: orderViewModel)

        return cell
    }
}


