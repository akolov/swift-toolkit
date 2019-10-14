//
//  String+Optional.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-07-27.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

extension Optional where Wrapped == String {

  public var isNilOrEmpty: Bool {
    if let unwrapped = self {
      return unwrapped.isEmpty
    }
    else {
      return true
    }
  }

}
