//
//  Preview.Extensions.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/25/22.
//

import SwiftUI

// MARK: - View
extension View {
  func previewWithName(_ name: String) -> some View {
    self
      .padding()
      .previewLayout(.sizeThatFits)
      .previewDisplayName(name)
  }

  func namesPreview() -> some View {
    let name = String.name(for: type(of: self))
    return previewWithName(name)
  }
}

// MARK: - String
extension String {
  static func name<T>(for type: T) -> String {
    String(reflecting: type)
      .components(separatedBy: ".")
      .last ?? ""
  }
}
