//
//  DateFormatter+Description.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-12-28.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

extension DateFormatter.Style: CustomStringConvertible {

  public var description: String {
    switch self {
    case .full:
      return "full"
    case .long:
      return "long"
    case .medium:
      return "medium"
    case .none:
      return "none"
    case .short:
      return "short"
    @unknown default:
      return "unknown"
    }
  }

}
