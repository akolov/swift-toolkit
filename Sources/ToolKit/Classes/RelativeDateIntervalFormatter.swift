//
//  RelativeDateIntervalFormatter.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-12-09.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

public final class RelativeDateIntervalFormatter: DateComponentsFormatter {

  public override init() {
    super.init()
    commonInit()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  private func commonInit() {
    unitsStyle = .full
    allowsFractionalUnits = true
    maximumUnitCount = 1
    collapsesLargestUnit = false
    zeroFormattingBehavior = .dropAll
  }

  public override func string(from startDate: Date, to endDate: Date) -> String? {
    return string(from: startDate, to: endDate, units: [])
  }

  public func string(from startDate: Date, to endDate: Date, units: NSCalendar.Unit) -> String? {
    let calendar = Calendar.autoupdatingCurrent
    let calendarComponents: Set<Calendar.Component> = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
    let components: DateComponents
    if startDate > endDate {
      components = calendar.dateComponents(calendarComponents, from: endDate, to: startDate)
    }
    else {
      components = calendar.dateComponents(calendarComponents, from: startDate, to: endDate)
    }

    if !units.isEmpty {
      allowedUnits = units
    }
    else if let year = components.year, year >= 1 {
      allowedUnits = .year
    }
    else if let month = components.month, month >= 1 {
      allowedUnits = .month
    }
    else if let weekOfMonth = components.weekOfMonth, weekOfMonth >= 1 {
      allowedUnits = .weekOfMonth
    }
    else if let day = components.day, day >= 1 {
      allowedUnits = .day
    }
    else if let hour = components.hour, hour >= 1 {
      allowedUnits = .hour
    }
    else if let minute = components.minute, minute >= 1 {
      allowedUnits = .minute
    }
    else {
      allowedUnits = .second
    }

    var formattedString: String?
    if startDate > endDate {
      if let string = super.string(from: endDate, to: startDate) {
        formattedString = pastFormatter?(string) ?? string
      }
    }
    else if startDate < endDate {
      if let string = super.string(from: startDate, to: endDate) {
        formattedString = futureFormatter?(string) ?? string
      }
    }
    else {
      if let string = super.string(from: startDate, to: endDate) {
        formattedString = nowFormatter?(string) ?? string
      }
    }

    return formattedString
  }

  // MARK: Properties

  public var futureFormatter: ((String) -> String)?
  public var nowFormatter: ((String) -> String)?
  public var pastFormatter: ((String) -> String)?

}
