//
//  ActiveOrdersListModuleBuilder.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

class ActiveOrdersListModuleBuilder: ModuleBuildering {
    static func createModule() -> UIViewController {
        let viewController = ActiveOrdersListViewController()
        let presenter = ActiveOrdersListPresenter(view: viewController)

        viewController.presenter = presenter

        return viewController
    }
}
