//
//  ActiveOrdersListPresenter.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import Foundation

class ActiveOrdersListPresenter {
    // MARK: - Public Properties

    weak var view: ActiveOrdersListViewProtocol?
    var activeOrdersDataSource: ActiveOrdersDataSource

    // MARK: - Init

    init(view: ActiveOrdersListViewProtocol, activeOrdersDataSource: ActiveOrdersDataSource) {
        self.view = view
        self.activeOrdersDataSource = activeOrdersDataSource
    }
}

// MARK: - ActiveOrdersListPresenterProtocol

extension ActiveOrdersListPresenter: ActiveOrdersListPresenterProtocol {
}
