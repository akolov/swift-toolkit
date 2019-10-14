//
//  NSAttributedSting+RangeCheck.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-07-23.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

extension NSAttributedString {

  public func isValid(range: NSRange) -> Bool {
    return range.location != NSNotFound
      && range.location <= string.count
      && range.length <= string.count - range.location
  }

}
