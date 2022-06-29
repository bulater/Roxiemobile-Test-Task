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
    var orderDetailViewModel: ActiveOrdersViewModel?

    // MARK: - Init

    init(view: OrderDetailViewProtocol) {
        self.view = view
    }
}

// MARK: - OrderDetailPresenterProtocol

extension OrderDetailPresenter: OrderDetailPresenterProtocol {
    func getOrder() -> ActiveOrdersViewModel? {
        guard let order = orderDetailViewModel else { return nil }

        return order
    }
}
