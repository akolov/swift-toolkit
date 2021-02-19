//
//  String+SHA256.swift
//  ToolKit
//
//  Created by Alexander Kolov on 2020-11-24.
//  Copyright © 2020 Wineapp Ltd. All rights reserved.
//

import CommonCrypto
import Foundation

extension String {

  public func sha256() -> String {
    if let stringData = data(using: String.Encoding.utf8) {
      return digest(input: stringData).toHexString()
    }
    return ""
  }

  private func digest(input: Data) -> Data {
    let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
    var hash = [UInt8](repeating: 0, count: digestLength)
    _ = input.withUnsafeBytes {
      CC_SHA256($0.baseAddress, UInt32(input.count), &hash)
    }
    return Data(bytes: hash, count: digestLength)
  }

}
