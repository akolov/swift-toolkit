//
//  AssociatedStorage.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2021-03-24.
//  Copyright © 2021 Alexander Kolov. All rights reserved.
//

import Foundation

private var associatedObjectsKey: UInt8 = 0

public protocol AssociatedStorage: AnyObject { }

extension AssociatedStorage {

  public var associatedObjects: AssociatedObjectsContainer {
    guard let container = objc_getAssociatedObject(self, &associatedObjectsKey) as? AssociatedObjectsContainer else {
      let container = AssociatedObjectsContainer()
      objc_setAssociatedObject(self, &associatedObjectsKey, container, .OBJC_ASSOCIATION_RETAIN)
      return container
    }
    return container
  }

}

public class AssociatedObjectsContainer  {

  private var storage = [String: Any]()

  public subscript<T>(key: String) -> T? {
    get {
      return self.storage[key] as? T
    }
    set {
      self.storage[key] = newValue
    }
  }

}
