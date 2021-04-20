//
//  String+Interpolation.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2021-04-20.
//  Copyright © 2021 Alexander Kolov. All rights reserved.
//

extension String.StringInterpolation {

  /// Optional Interpolation Styles
  public enum OptionalStyle {
    /// Includes the word `Optional` for both `some` and `none` cases
    case descriptive
    /// Strips the word `Optional` for both `some` and `none` cases
    case stripped
    /// Uses system interpolation, which includes the word `Optional` for
    /// `some` cases but not `none`.
    case `default`
  }

  /// Interpolates optional values using a supplied `optStyle` style
  public mutating func appendInterpolation<T>(_ value: T?, optStyle style: OptionalStyle) {
    switch style {
    // Includes the word `Optional` for both `some` and `none` cases
    case .descriptive:
      if value == nil {
        appendLiteral("Optional(nil)")
      }
      else {
        appendLiteral(String(describing: value))
      }

    // Strips the word `Optional` for both `some` and `none` cases
    case .stripped:
      if let value = value {
        appendInterpolation(value)
      }
      else {
        appendLiteral("nil")
      }

    // Uses system interpolation, which includes the word `Optional` for
    // `some` cases but not `none`.
    default:
      appendLiteral(String(describing: value))
    }
  }

  /// Interpolates an optional using "stripped" interpolation, omitting
  /// the word "Optional" from both `.some` and `.none` cases
  public mutating func appendInterpolation<T>(describing value: T?) {
    appendInterpolation(value, optStyle: .stripped)
  }

  /// Provides Boolean-guided interpolation that succeeds only when the condition
  /// evaluates to true.
  public mutating func appendInterpolation(if condition: @autoclosure () -> Bool, _ literal: StringLiteralType, optStyle: OptionalStyle) {
    guard condition() else { return }
    appendLiteral(literal)
  }

}
