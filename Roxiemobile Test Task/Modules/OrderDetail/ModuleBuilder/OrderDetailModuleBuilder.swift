//
//  OrderDetailModuleBuilder.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

class OrderDetailModuleBuilder: ModuleBuildering {
    static func createModule(with type: ModuleType) -> UIViewController {
        let viewController = OrderDetailViewController()
        let presenter = OrderDetailPresenter(view: viewController)

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
