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

    // MARK: - Private Properties


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

    // MARK: - Public Methods


    // MARK: - Private Methods
}

// MARK: - ActiveOrdersListViewProtocol

extension ActiveOrdersListViewController: ActiveOrdersListViewProtocol {

}

// MARK: - ActiveOrdersListViewDelegate

extension ActiveOrdersListViewController: ActiveOrdersListViewDelegate {

}
