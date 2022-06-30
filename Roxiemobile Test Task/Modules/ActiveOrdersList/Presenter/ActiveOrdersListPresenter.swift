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
    var coordinator: OrdersListCoorinating

    // MARK: - Init

    init(view: ActiveOrdersListViewProtocol,
         activeOrdersDataSource: ActiveOrdersDataSource,
         coordinator: OrdersListCoorinating) {
        self.view = view
        self.activeOrdersDataSource = activeOrdersDataSource
        self.coordinator = coordinator
    }

    // MARK: - Private Methods

    private func fetchActiveOrdersModels() {
        NetworkManager.shared.fetchActiveOrdersData(of: [ActiveOrders].self) { result in
            switch result {
            case .success(let data):
                let sortedViewModels =  ActiveOrdersMapper.getSortedActiveOrdersViewModelsFrom(orders: data)
                self.activeOrdersDataSource.activeOrversViewModels = sortedViewModels

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

    func handleSelectOrederAt(index: Int) {
        let models = activeOrdersDataSource.activeOrversViewModels
        coordinator.pushOrderDetail(with: models[index])
    }
}
