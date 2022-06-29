//
//  OrderDetailPresenterProtocol.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import Foundation

protocol OrderDetailPresenterProtocol {
    var orderDetailViewModel: ActiveOrdersViewModel? { get set}
    func getOrder() -> ActiveOrdersViewModel?
    func handleTapBackButton()
}
