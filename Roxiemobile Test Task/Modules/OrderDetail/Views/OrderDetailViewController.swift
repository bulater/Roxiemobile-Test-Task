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

    lazy var backButton = UIBarButtonItem()

    // MARK: - LifeCycle

    override func loadView() {
        super.loadView()
        let view = OrderDetailView()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    // MARK: - Private Methods

    private func setupNavigationBar() {
        backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"),
                                               style: .plain,
                                               target: self,
                                               action: #selector(didTapBackButton))
        backButton.tintColor = .black

        navigationItem.leftBarButtonItem = backButton
    }

    @objc private func didTapBackButton() {
        presenter?.handleTapBackButton()
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

