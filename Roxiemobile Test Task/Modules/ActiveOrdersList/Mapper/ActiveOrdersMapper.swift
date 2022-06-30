//
//  ActiveOrdersMapper.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 30.06.2022.
//

import Foundation

class ActiveOrdersMapper {
    static func getSortedActiveOrdersViewModelsFrom(orders: [ActiveOrders]) -> [ActiveOrdersViewModel] {
        let dateFormatter = ISO8601DateFormatter()
        let activeOrdersViewModel = orders.map({ ActiveOrdersViewModel(order: $0)})
        let sortedActiveOrdersViewModel = activeOrdersViewModel.sorted(by: {
            dateFormatter.date(from: $0.orderTime) ?? Date() < dateFormatter.date(from: $1.orderTime) ?? Date()
        })

        return sortedActiveOrdersViewModel
    }
}
