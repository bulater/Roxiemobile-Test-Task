//
//  ActiveOrdersListModuleBuilder.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

class ActiveOrdersListModuleBuilder: ModuleBuildering {
    static func createModule(with type: ModuleType) -> UIViewController {
        let viewController = ActiveOrdersListViewController()
        let activeOrdersDataSource = ActiveOrdersDataSource()
        let presenter = ActiveOrdersListPresenter(view: viewController,
                                                  activeOrdersDataSource: activeOrdersDataSource)

        viewController.presenter = presenter

        return viewController
    }
}
