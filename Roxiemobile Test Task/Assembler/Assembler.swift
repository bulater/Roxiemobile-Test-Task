//
//  Assembler.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import UIKit

enum ModuleType {
    case orderDetail(ActiveOrdersViewModel?)
    case `default`
}

protocol ModuleBuildering {
    static func createModule(with type: ModuleType) -> UIViewController
}
