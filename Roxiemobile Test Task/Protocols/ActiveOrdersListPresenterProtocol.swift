//
//  ActiveOrdersListPresenterProtocol.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 28.06.2022.
//

import Foundation

protocol ActiveOrdersListPresenterProtocol {
    func handleAppearingView()
    func getActiveOrderAt(index: Int) -> ActiveOrdersViewModel?
    func getActiveOrdersCount() -> Int?
    func handleSelectOrederAt(index: Int)
}
