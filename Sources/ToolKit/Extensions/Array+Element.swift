//
//  Array+Element.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-07-23.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

extension Array {

  public func element(at index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }

}
