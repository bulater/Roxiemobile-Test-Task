//
//  OrderDetailView.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

protocol OrderDetailViewViewDelegate: AnyObject {
    func orderDetailViewGetOrder(_ orderDetailView: OrderDetailView) -> ActiveOrdersViewModel?
}

class OrderDetailView: UIView {
    // MARK: - Public Properties

    weak var delegate: OrderDetailViewViewDelegate?
    lazy var orderDetailTableView: OrderDetailTableView = { OrderDetailView.makeOrderDetailTableView(self) }()

    // MARK: - Private Properties


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
        addSubview(orderDetailTableView)
        activateOrderDetailTableViewConstraints()
    }

    static func makeOrderDetailTableView(_ delegate: OrderDetailTableViewCustomDelegate) -> OrderDetailTableView {
        let tableView = OrderDetailTableView(frame: .zero, style: .grouped)
        tableView.customDelegate = delegate
        tableView.backgroundColor = .white
        tableView.register(OrderDetailTableViewCell.self, forCellReuseIdentifier: OrderDetailTableViewCell.cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }

    // MARK: - Layout

    private func activateOrderDetailTableViewConstraints() {
        NSLayoutConstraint.activate([
            orderDetailTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            orderDetailTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            orderDetailTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            orderDetailTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - OrderDetailTableViewCustomDelegate

extension OrderDetailView: OrderDetailTableViewCustomDelegate {
    func orderDetailTableViewGetOrder(_ orderDetailTableView: OrderDetailTableView) -> ActiveOrdersViewModel? {
        delegate?.orderDetailViewGetOrder(self)
    }
}
