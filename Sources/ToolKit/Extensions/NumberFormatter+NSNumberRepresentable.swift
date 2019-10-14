//
//  NumberFormatter+NSNumberRepresentable.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-06-19.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

public protocol NSNumberRepresentable {

  var asNSNumber: NSNumber { get }

}

extension Decimal: NSNumberRepresentable {

  public var asNSNumber: NSNumber {
    return self as NSNumber
  }

}

extension Float: NSNumberRepresentable {

  public var asNSNumber: NSNumber {
    return self as NSNumber
  }

}

extension Int: NSNumberRepresentable {

  public var asNSNumber: NSNumber {
    return self as NSNumber
  }

}

extension NumberFormatter {

  public func string(from number: NSNumberRepresentable) -> String? {
    return string(from: number.asNSNumber)
  }

}
