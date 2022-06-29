//
//  OrderCoordinator.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

protocol OrdersListCoorinating {
    func pushOrderDetail(with order: ActiveOrdersViewModel?)
}

protocol OrderDetailCoordinating {
    func popToOrdersList()
}

class OrderCoordinator: Coordinating {
    // MARK: - Public properties

    weak var parent: Coordinating?
    var childCoordinators: [Coordinating] = []

    // MARK: - Private properties

    private let navigationController: UINavigationController

    // MARK: - Init

    init(navigationController: UINavigationController, parent: Coordinating? = nil) {
        self.navigationController = navigationController
        self.parent = parent
    }

    // MARK: - Public Methods

    func start() {
        let viewController = ActiveOrdersListModuleBuilder.createModule(with: .default, self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - Public OrdersListCoorinating

extension OrderCoordinator: OrdersListCoorinating {
    func pushOrderDetail(with order: ActiveOrdersViewModel?) {
        let viewController = OrderDetailModuleBuilder.createModule(with: .orderDetail(order), self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - Public OrderDetailCoordinating

extension OrderCoordinator: OrderDetailCoordinating {
    func popToOrdersList() {
        guard let viewController = navigationController.viewControllers.first(where: { $0 is ActiveOrdersListViewController } ) else { return  }
        navigationController.popToViewController(viewController, animated: true)
    }
}
