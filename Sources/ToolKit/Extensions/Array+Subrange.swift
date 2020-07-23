//
//  Array+Subrange.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2020-07-23.
//  Copyright © 2020 Alexander Kolov. All rights reserved.
//

extension Array {

  public func subrange(in range: ClosedRange<Index>) -> ArraySlice<Element> {
    guard indices.contains(range.lowerBound), let last = indices.last else {
      return self[0..<0]
    }

    let lower = range.lowerBound
    let upper = Swift.min(range.upperBound, last)
    return self[lower...upper]
  }

  public func subrange(in range: Range<Index>) -> ArraySlice<Element> {
    guard indices.contains(range.lowerBound) else {
      return self[0..<0]
    }

    let lower = range.lowerBound
    let upper = Swift.min(range.upperBound, indices.upperBound)
    return self[lower..<upper]
  }

}
