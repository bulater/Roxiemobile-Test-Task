//
//  OrderDetailPresenter.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import Foundation

class OrderDetailPresenter {
    // MARK: - Public Properties

    weak var view: OrderDetailViewProtocol?

    // MARK: - Init

    init(view: OrderDetailViewProtocol) {
        self.view = view
    }

    // MARK: - Private Methods
}

// MARK: - OrderDetailPresenterProtocol

extension OrderDetailPresenter: OrderDetailPresenterProtocol {
}
