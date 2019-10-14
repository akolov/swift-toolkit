//
//  WeakBox.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-07-16.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

public struct WeakBox<T: AnyObject> {

  public init(_ value: T) {
    self.value = value
  }

  public weak var value: T?

}
