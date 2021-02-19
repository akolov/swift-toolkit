//
//  Array+HexString.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2020-11-24.
//  Copyright © 2020 Wineapp Ltd. All rights reserved.
//

extension Array where Element == UInt8 {

  public func toHexString() -> String {
    `lazy`.reduce(into: "") {
      var s = String($1, radix: 16)
      if s.count == 1 {
        s = "0" + s
      }
      $0 += s
    }
  }

}
