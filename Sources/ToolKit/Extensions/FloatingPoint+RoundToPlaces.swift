//
//  FloatingPoint+RoundToPlaces.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-09-20.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

extension FloatingPoint {

  public func rounded(places: Int) -> Self {
    let divisor = Self(Int(pow(10.0, Double(places))))
    return (self * divisor).rounded() / divisor
  }

}
