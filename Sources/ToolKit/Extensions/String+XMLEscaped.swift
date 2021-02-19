//
//  String+XMLEscaped.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2020-11-24.
//  Copyright © 2020 Wineapp Ltd. All rights reserved.
//

import Foundation

extension UInt32 {

  fileprivate var isAmpersand: Bool {
    // unicode value of &
    return self == 0x26
  }

  fileprivate var isASCII: Bool {
    // Less than 0x80
    return self < 0x80
  }

  /// https://www.w3.org/International/questions/qa-escapes#use
  fileprivate var isAttributeSyntax: Bool {
    // unicode values of [", ']
    return self == 0x22 || self == 0x27
  }

  fileprivate var isSafeASCII: Bool {
    return self.isASCII && !self.isAttributeSyntax && !self.isTagSyntax
  }

  /// https://www.w3.org/International/questions/qa-escapes#use
  fileprivate var isTagSyntax: Bool {
    // unicode values of [&, < , >]
    return self.isAmpersand || self == 0x3C || self == 0x3E
  }

}

extension String {

  public var xmlEscaped: String {
    var str: String = ""

    for c in self {
      let unicodes = String(c).unicodeScalars

      if unicodes.count == 1, let unicode = unicodes.first?.value {
        if unicode.isSafeASCII {
          str += String(c)
        }
        else {
          switch unicode {
          case 0x26:
            str += String("&amp;")
          case 0x22:
            str += String("&quot;")
          case 0x27:
            str += String("&#39;")
          case 0x3E:
            str += String("&#gt;")
          case 0x3C:
            str += String("&#lt;")
          default:
            str += String(c)
          }
        }
      }
      else {
        str += String(c)
      }
    }

    return str
  }

}
