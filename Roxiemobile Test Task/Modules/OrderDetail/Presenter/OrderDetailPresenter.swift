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
    var coordinator: OrderDetailCoordinating

    // MARK: - Init

    init(view: OrderDetailViewProtocol, coordinator: OrderDetailCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
}

// MARK: - OrderDetailPresenterProtocol

extension OrderDetailPresenter: OrderDetailPresenterProtocol {
    func getOrder() -> ActiveOrdersViewModel? {
        guard let order = orderDetailViewModel else { return nil }

        return order
    }

    func handleTapBackButton() {
        coordinator.popToOrdersList()
    }
}
