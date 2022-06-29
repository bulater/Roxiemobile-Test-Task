//
//  AppCoordinator.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import UIKit

protocol Coordinating: AnyObject {
    var childCoordinators: [Coordinating] { get set }
    var parent: Coordinating? { get set }

    func start()
    func childCoordinatorWillStart(_ chlid: Coordinating)
    func childCoordinatorDidFinish(_ child: Coordinating)
}

class AppCoordinator: Coordinating {
    // MARK: - Public Properties

    var childCoordinators: [Coordinating] = []
    var parent: Coordinating?

    // MARK: - Private Properties

    private var navigationController: UINavigationController

    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Public Methods

    func start() {
        let coordinator = OrderCoordinator(navigationController: navigationController, parent: self)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}

// MARK: - Coordinating

extension Coordinating {
    func childCoordinatorWillStart(_ chlid: Coordinating) {
      guard !childCoordinators.contains(where: { $0 === chlid }) else { return }
      childCoordinators.append(chlid)
    }

    func childCoordinatorDidFinish(_ child: Coordinating) {
        guard childCoordinators.isEmpty == false else { return }

        for (index, element) in childCoordinators.enumerated() where element === child {
            childCoordinators.remove(at: index)
            break
        }
    }
}
