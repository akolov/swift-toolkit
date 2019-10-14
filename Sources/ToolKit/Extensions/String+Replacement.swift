//
//  String+Replacement.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2018-11-28.
//  Copyright © 2018 Alexander Kolov. All rights reserved.
//

import Foundation

extension String {

  public func replacingCharacters(from characterSet: CharacterSet, with replacement: String) -> String {
    return components(separatedBy: characterSet).joined(separator: replacement)
  }

}
