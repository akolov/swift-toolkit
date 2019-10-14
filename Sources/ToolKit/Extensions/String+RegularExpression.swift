//
//  String+RegularExpression.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2019-04-16.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

import Foundation

extension String {

  public func matchingStrings(regex: String) -> [[String]] {
    guard let regex = try? NSRegularExpression(pattern: regex, options: []) else {
      return []
    }

    let range = NSRange(startIndex..<endIndex, in: self)
    let results = regex.matches(in: self, options: [], range: range)
    return results.map { result in
      (0..<result.numberOfRanges).map {
        if let subrange = Range(result.range(at: $0), in: self) {
          return String(self[subrange])
        }
        else {
          return ""
        }
      }
    }
  }

}
