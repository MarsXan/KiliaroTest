//
//  DateTimeUtil.swift
//  KiliaroTest
//
//  Created by mohsen mokhtari on 2/13/22.
//

import Foundation
import SwifterSwift

struct DateTimeUtil {
    static func secondToMin(_ second: Int) -> String {
        if (second > 60) {
            return "\(second / 60):\(second % 60)"
        } else if (second > 0) {
            if second > 9 {
                return "00:\(second)"
            } else {
                return "00:0\(second)"
            }

        } else {
            return "00:00"
        }
    }

    static func getTime(time: Double) -> String {
        return Date(unixTimestamp: time).timeString(ofStyle: .short).lowercased()
    }

    
    static func getDayAndmonth(time: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:time)!
        return "\(date.year), \(date.day.string ) \(date.monthName(ofStyle: .threeLetters) ) at \(date.timeString(ofStyle: .short).lowercased())"
    }
    static func getDayAndmonth(time: Double) -> String {
        let date = Date(unixTimestamp: time)
        return "\(date.dayName()), \(date.day) \(date.monthName(ofStyle: .threeLetters))"
    }

    static func getDay(time: Double) -> String {
         Date(unixTimestamp: time).dayName(ofStyle: .full)
    }
    
    static func getYear(time: Double) -> String {
        Date(unixTimestamp: time).year.string
    }
    
    static func getMonth(time: Double) -> String {
        let date = Date(unixTimestamp: time)
       return date.monthName(ofStyle: .threeLetters)
    }
    
    static func getStyledMonthAndTime(time: Double) -> String {
        return "\(getDayAndmonth(time: time)) at \(getTime(time: time))"
    }

    static func getStyledDate(time: Double) -> String {
        return "\(getDayAndmonth(time: time)) at \(getTime(time: time))"
    }
    
    static func getDaysName(dayList:[Int]) -> String{
        var days=""
        dayList.forEach{
            switch $0 {
            
            case 0:
                days += "Su, "
            case 1:
                days +=  "M, "
            case 2:
                days += "Th, "
            case 3:
                days += "W, "
            case 4:
                days += "Tu, "
            case 5:
                days += "F, "
            case 6:
                days += "Sa, "
            default:
                days += ""
            }
        }
        if days.last == " "
        {
            days =  String(days.prefix(days.count-1))
        }
        if days.last == ","
        {
            days =  String(days.prefix(days.count-1))
        }
        return days
    }
    
   static func  getDateFromTimeZone(timeZone:String?) -> String{
        guard timeZone != nil else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"

        let timeZone = TimeZone(identifier: timeZone!)

        dateFormatter.timeZone = timeZone

        return dateFormatter.string(from: Date())
    }

}

