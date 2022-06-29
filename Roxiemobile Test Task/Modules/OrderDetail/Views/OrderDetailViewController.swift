//
//  OrderDetailViewController.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

class OrderDetailViewController: UIViewController {
    // MARK: - Public Properties

    var presenter: OrderDetailPresenterProtocol?

    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        let view = OrderDetailView()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - OrderDetailViewProtocol

extension OrderDetailViewController: OrderDetailViewProtocol {
}

// MARK: - ActiveOrdersListViewDelegate

extension OrderDetailViewController: OrderDetailViewViewDelegate {
    func orderDetailViewGetOrder(_ orderDetailView: OrderDetailView) -> ActiveOrdersViewModel? {
        presenter?.getOrder()
    }
}

