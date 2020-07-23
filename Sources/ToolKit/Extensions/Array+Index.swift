//
//  Array+Element.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2020-02-20.
//  Copyright © 2020 Alexander Kolov. All rights reserved.
//

import Foundation

extension Array where Element: Collection, Element.Index == Int {

  public func firstIndexPath(where predicate: (Element.Iterator.Element) -> Bool) -> IndexPath? {
    for (i, row) in self.enumerated() {
      if let j = row.firstIndex(where: predicate) {
        return IndexPath(indexes: [i, j])
      }
    }
    return nil
  }

}
