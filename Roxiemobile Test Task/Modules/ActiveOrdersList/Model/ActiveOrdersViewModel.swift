//
//  ActiveOrdersViewModel.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import Foundation

struct ActiveOrdersViewModel {
    var startCity: String
    var startAdress: String
    var endCity: String
    var endAddress: String
    var orderTime: String
    var amount: String
    var currency: String

    init(order: ActiveOrders) {
        self.startCity = order.startAddress.city
        self.startAdress = order.startAddress.address
        self.endCity = order.endAddress.address
        self.endAddress = order.endAddress.address
        self.orderTime = order.orderTime
        self.amount = String(order.price.amount)
        self.currency = order.price.currency
    }
}
