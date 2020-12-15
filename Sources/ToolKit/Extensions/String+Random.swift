//
//  String+Random.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2020-12-15.
//  Copyright © 2020 Alexander Kolov. All rights reserved.
//

import Foundation

extension String {

  public static func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).compactMap { _ in letters.randomElement() })
  }

}
