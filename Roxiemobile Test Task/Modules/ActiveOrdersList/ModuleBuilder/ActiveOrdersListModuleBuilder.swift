//
//  ActiveOrdersListModuleBuilder.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

class ActiveOrdersListModuleBuilder: ModuleBuildering {
    static func createModule(with type: ModuleType, _ coordinator: Coordinating) -> UIViewController {
        let viewController = ActiveOrdersListViewController()
        let activeOrdersDataSource = ActiveOrdersDataSource()
        guard let coordinator = coordinator as? OrdersListCoorinating else { return viewController }
        let presenter = ActiveOrdersListPresenter(view: viewController,
                                                  activeOrdersDataSource: activeOrdersDataSource,
                                                  coordinator: coordinator)

        viewController.presenter = presenter

        return viewController
    }
}
