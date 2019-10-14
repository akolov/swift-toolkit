//
//  Atomic.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2019-02-08.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

import Dispatch

public final class Atomic<A> {

  public init(_ value: A) {
    self._value = value
  }

  public var value: A {
    return queue.sync { self._value }
  }

  public func mutate(_ transform: (inout A) -> Void) {
    queue.sync(flags: .barrier) { transform(&self._value) }
  }

  private let queue = DispatchQueue(label: "com.alexkolov.toolkit-atomic-serial-queue", attributes: .concurrent)
  private var _value: A

}
