//
//  String+DateFormatter.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import Foundation

extension String {
    func dateFormate() -> String {
        let dateFormatter = ISO8601DateFormatter()
        guard let theDate = dateFormatter.date(from: self) else { return ""}
        let newDateFormater = DateFormatter()
        newDateFormater.dateFormat = "MM-dd-yyyy HH:mm"

        return newDateFormater.string(from: theDate)
    }
}
