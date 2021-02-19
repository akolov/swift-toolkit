//
//  Decimal+WholeNumber.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2019-06-05.
//  Copyright © 2019 Wineapp Ltd. All rights reserved.
//

import Foundation

extension Decimal {

  public var isWholeNumber: Bool {
    guard !isZero else {
      return true
    }

    guard isNormal else {
      return false
    }

    var myself = self
    var rounded = Decimal()
    NSDecimalRound(&rounded, &myself, 0, .plain)
    return self == rounded
  }

}
