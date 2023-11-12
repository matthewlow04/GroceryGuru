//
//  DateFormatting.swift
//  GroceryGuru
//
//  Created by Matthew Low on 2023-11-12.
//

import Foundation

func expiresMessage(date: Date) -> String {
    let minutes = Int(date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    if days < 0{
        return "Expired"
    }
    else if days < 1 {
        return "Today"
    }
    else if days < 2{
        return "Tomorrow"
    }
    else{
        return "\(days) days"
    }
}

func setDate(month: Int, day: Int, year: Int) -> Date{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let dateString = "\(year)-\(month)-\(day)"
    let expirationDate = dateFormatter.date(from: dateString)
    return expirationDate ?? Date.now
}
