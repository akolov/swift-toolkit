//
//  Error+HumanReadable.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-10-24.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

extension Error {

  public var legibleDescription: String {
    switch errorType {
    case .swiftError(.enum?):
      return "\(type(of: self)).\(self)"
    case .swiftError:
      return String(describing: self)
    case .swiftLocalizedError(let msg):
      return msg
    case .nsError(_, "kCLErrorDomain", 0):
      return "The location could not be determined."
    case .nsError(let nsError, _, _):
      if !localizedDescription.hasPrefix("The operation couldn’t be completed.") {
        return localizedDescription
      }
      else if let underlyingError = nsError.userInfo[NSUnderlyingErrorKey] as? Error {
        return underlyingError.legibleDescription
      }
      else {
        // usually better than the localizedDescription, but not pretty
        return nsError.debugDescription
      }
    }
  }

  private var errorType: ErrorType {
    if String(cString: object_getClassName(self)) != "_SwiftNativeNSError" {
      let nserr = self as NSError
      return .nsError(nserr, domain: nserr.domain, code: nserr.code)
    }
    else if let err = self as? LocalizedError, let msg = err.errorDescription {
      return .swiftLocalizedError(msg)
    }
    else {
      return .swiftError(Mirror(reflecting: self).displayStyle)
    }
  }

}

private enum ErrorType {

  case nsError(NSError, domain: String, code: Int)
  case swiftLocalizedError(String)
  case swiftError(Mirror.DisplayStyle?)

}
