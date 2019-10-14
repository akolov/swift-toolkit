//
//  Decimal+DoubleValue.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-12-07.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

extension Decimal {

  public var doubleValue: Double {
    return Double(truncating: self as NSNumber)
  }

}
