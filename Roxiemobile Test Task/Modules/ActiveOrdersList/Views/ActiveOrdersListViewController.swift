//
//  ActiveOrdersListViewController.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

class ActiveOrdersListViewController: UIViewController {
    // MARK: - Public Properties

    var presenter: ActiveOrdersListPresenterProtocol?

    // MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        let view = ActiveOrdersListView()
        view.delegate = self
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.handleAppearingView()
    }
}

// MARK: - ActiveOrdersListViewProtocol

extension ActiveOrdersListViewController: ActiveOrdersListViewProtocol {
    func reloadActiveOrdersTableView() {
        guard let view = view as? ActiveOrdersListView else { return }
        view.activeOrdersListTableView.reloadData()
    }
}

// MARK: - ActiveOrdersListViewDelegate

extension ActiveOrdersListViewController: ActiveOrdersListViewDelegate {
    func activeOrdersListViewGetCellsCount(_ activeOrdersListView: ActiveOrdersListView) -> Int? {
        presenter?.getActiveOrdersCount()
    }

    func activeOrdersListView(_ activeOrdersListView: ActiveOrdersListView, getOrderAt index: Int) -> ActiveOrdersViewModel? {
        presenter?.getActiveOrderAt(index: index)
    }
}
