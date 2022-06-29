//
//  OrderDetailModuleBuilder.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

class OrderDetailModuleBuilder: ModuleBuildering {
    static func createModule(with type: ModuleType, _ coordinator: Coordinating) -> UIViewController {
        let viewController = OrderDetailViewController()
        guard let coordinator = coordinator as? OrderDetailCoordinating else { return viewController }
        let presenter = OrderDetailPresenter(view: viewController, coordinator: coordinator)

        viewController.presenter = presenter

        switch type {
        case .orderDetail(let order):
            presenter.orderDetailViewModel = order
        default:
            break
        }

        return viewController
    }
}
