//
//  AutoreleasingTimer.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-08-31.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

public final class AutoreleasingTimer {

  private struct TimerContainer {

    init(interval: TimeInterval, repeats: Bool, executionBlock: @escaping (Timer) -> Void) {
      self.executionBlock = executionBlock
      timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: repeats, block: executionBlock)
    }

    init(date: Date, interval: TimeInterval, repeats: Bool, executionBlock: @escaping (Timer) -> Void) {
      self.executionBlock = executionBlock
      timer = Timer(fire: date, interval: interval, repeats: repeats, block: executionBlock)
      RunLoop.current.add(timer, forMode: .default)
    }

    let executionBlock: (Timer) -> Void
    let timer: Timer

  }

  public init(interval: TimeInterval, repeats: Bool, executionBlock: @escaping (Timer) -> Void) {
    container = TimerContainer(interval: interval, repeats: repeats, executionBlock: executionBlock)
  }

  public init(date: Date, interval: TimeInterval, repeats: Bool, executionBlock: @escaping (Timer) -> Void) {
    container = TimerContainer(date: date, interval: interval, repeats: repeats, executionBlock: executionBlock)
  }

  deinit {
    invalidate()
  }

  public func fire() {
    container.timer.fire()
  }

  private func invalidate() {
    container.timer.invalidate()
  }

  private let container: TimerContainer

}
