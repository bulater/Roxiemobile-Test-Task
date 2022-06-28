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

    // MARK: - Init

    init(view: ActiveOrdersListViewProtocol) {
        self.view = view
    }
}

// MARK: - ActiveOrdersListPresenterProtocol

extension ActiveOrdersListPresenter: ActiveOrdersListPresenterProtocol {
}
