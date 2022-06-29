//
//  String+DateFormatter.swift
//  Roxiemobile Test Task
//
//  Created by Булат Сагдиев on 29.06.2022.
//

import Foundation

extension String {
    enum DateFormat: String {
        case date = "MM-dd-yyyy"
        case dateAndTime = "MM-dd-yyyy HH:mm"
    }
    
    func dateFormate(with type: DateFormat) -> String {
        let dateFormatter = ISO8601DateFormatter()
        guard let theDate = dateFormatter.date(from: self) else { return ""}
        let newDateFormater = DateFormatter()
        newDateFormater.dateFormat = type.rawValue

        return newDateFormater.string(from: theDate)
    }
}
