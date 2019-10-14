//
//  Decimal+RoundToPlaces.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-12-07.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

extension Decimal {

  public func rounded(places: Int) -> Decimal {
    var value = self
    var roundedValue = Decimal()
    NSDecimalRound(&roundedValue, &value, places, .plain)
    return roundedValue
  }

}
