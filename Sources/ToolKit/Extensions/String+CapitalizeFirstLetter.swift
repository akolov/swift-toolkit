//
//  String+CapitalizeFirstLetter.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2019-08-02.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

extension String {

  public func capitalizingFirstLetter() -> String {
    return prefix(1).uppercased() + lowercased().dropFirst()
  }

  public mutating func capitalizeFirstLetter() {
    self = capitalizingFirstLetter()
  }

}
