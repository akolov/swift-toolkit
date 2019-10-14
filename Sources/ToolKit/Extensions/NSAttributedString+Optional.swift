//
//  NSAttributedString+Optional.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-12-07.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

extension Optional where Wrapped == NSAttributedString {

  public var isNilOrEmpty: Bool {
    if let unwrapped = self {
      return unwrapped.string.isEmpty
    }
    else {
      return true
    }
  }

}
