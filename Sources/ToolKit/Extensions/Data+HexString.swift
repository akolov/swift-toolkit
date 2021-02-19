//
//  Data+HexString.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2020-11-24.
//  Copyright © 2020 Wineapp Ltd. All rights reserved.
//

import Foundation

extension Data {

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
