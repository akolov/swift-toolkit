//
//  ArraySlice+SafeSubscript.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-12-10.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

extension ArraySlice {

  public subscript(safe index: Int) -> Element? {
    get {
      if index >= 0 && index < count {
        return self[index]
      }

      return nil
    }
    set {
      if index >= 0 && index < count {
        if let newValue = newValue {
          self[index] = newValue
        }
      }
    }
  }

}
