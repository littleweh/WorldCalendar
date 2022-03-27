//
//  URLHelper.swift
//  WorldCalendar
//
//  Created by 小威 on 2022/3/27.
//

import Foundation

struct URLHelper {
    static private let mindiWorldCalendarWebPage = "https://mindiworldnews.com/calendar"

    static var todayUrl: URL? {
        let todayComponents = Calendar.current.dateComponents(in: TimeZone.current, from: Date())
        guard let month = todayComponents.month,
              let day = todayComponents.day,
              DateHelper.isLinkExistWith(month: month, day: day)
        else { return nil }

        return URL(string: (mindiWorldCalendarWebPage + "-\(month)-\(day)"))
    }

    static func urlFromMindiWorldWith(month: Int, day: Int) -> URL? {
        guard let parameter = dateStringFrom(month: month, day: day),
              DateHelper.isLinkExistWith(month: month, day: day)
        else { return nil }
        return URL(string: (mindiWorldCalendarWebPage + parameter))
    }

    static private func dateStringFrom(month: Int, day: Int) -> String? {
        let components = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current, year: 2022, month: month, day: day)
        guard components.isValidDate else { return nil }

        guard let month = components.month, let day = components.day else { return nil }
        return "-\(month)-\(day)"
    }
}
