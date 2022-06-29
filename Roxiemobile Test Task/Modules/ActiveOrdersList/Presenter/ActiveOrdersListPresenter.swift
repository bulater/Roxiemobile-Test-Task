//
//  ActiveOrdersListPresenter.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import Foundation

class ActiveOrdersListPresenter {
    // MARK: - Public Properties

    weak var view: ActiveOrdersListViewProtocol?
    var activeOrdersDataSource: ActiveOrdersDataSource

    // MARK: - Init

    init(view: ActiveOrdersListViewProtocol, activeOrdersDataSource: ActiveOrdersDataSource) {
        self.view = view
        self.activeOrdersDataSource = activeOrdersDataSource
    }

    // MARK: - Private Methods

    private func fetchActiveOrdersModels() {
        NetworkManager.shared.fetchActiveOrdersData { result in
            switch result {
            case .success(let data):
                let viewModels = data.map { ActiveOrdersViewModel(order: $0) }
                self.activeOrdersDataSource.activeOrversViewModels = viewModels
                print(self.activeOrdersDataSource.activeOrversViewModels)

                DispatchQueue.main.async {
                    self.view?.reloadActiveOrdersTableView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - ActiveOrdersListPresenterProtocol

extension ActiveOrdersListPresenter: ActiveOrdersListPresenterProtocol {
    func handleAppearingView() {
        fetchActiveOrdersModels()
    }

    func getActiveOrderAt(index: Int) -> ActiveOrdersViewModel? {
        activeOrdersDataSource.activeOrversViewModels[index]
    }

    func getActiveOrdersCount() -> Int? {
        activeOrdersDataSource.activeOrversViewModels.count
    }
}
