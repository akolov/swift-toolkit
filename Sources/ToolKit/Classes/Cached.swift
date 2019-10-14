//
//  Cached.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-12-06.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

public class Cached<T> {

  public init(getter: @escaping () -> T, setter: ((T) -> Void)? = nil) {
    self.getter = getter
    self.setter = setter
  }

  // MARK: Properties

  public var value: T {
    get {
      if let _cached = cached {
        return _cached
      }

      let x = getter()
      cached = x
      return x
    }
    set {
      cached = newValue
      setter?(newValue)
    }
  }

  private var cached: T?
  private var getter: () -> T
  private var setter: ((T) -> Void)?

}
