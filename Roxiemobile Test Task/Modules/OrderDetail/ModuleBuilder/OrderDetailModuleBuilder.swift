//
//  OrderDetailModuleBuilder.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

class OrderDetailModuleBuilder: ModuleBuildering {
    static func createModule() -> UIViewController {
        let viewController = OrderDetailViewController()
        let presenter = OrderDetailPresenter(view: viewController)

        viewController.presenter = presenter

        return viewController
    }
}
