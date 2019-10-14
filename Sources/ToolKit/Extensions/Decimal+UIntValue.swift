//
//  Decimal+UIntValue.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2019-02-18.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

import Foundation

extension Decimal {

  public var uintValue: UInt {
    return UInt(truncating: self as NSNumber)
  }

}
