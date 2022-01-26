//
//  Extensions.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/21/22.
//

import Foundation
import SwiftUI

// MARK: - Int
extension Int {
  var formatted: String {
    if #available(iOS 15, *) {
      return self.formatted()
    } else {
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      return formatter.string(from: NSNumber(value: self)) ?? ""
    }
  }
}

// MARK: - Date
extension Date {
  var formatted: String {
    if #available(iOS 15, *) {
      return self.formatted()
    } else {
      let formatter = DateFormatter()
      formatter.dateStyle = .medium
      return formatter.string(from: self)
    }
  }
}

// MARK: - Color
extension Color {
  static var lightBlue: Color {
    Color(UIColor.systemBlue.colorWithOffsets(saturation: -0.5))
  }

  static var lightOrange: Color {
    Color(UIColor.systemOrange.colorWithOffsets(saturation: -0.5))
  }

  static var lightGreen: Color {
    Color(UIColor.systemGreen.colorWithOffsets(saturation: -0.15, brightness: 0.2))
  }

  static var lightTeal: Color {
    Color(UIColor.systemTeal.colorWithOffsets(saturation: -0.3))
  }
}

// MARK: - LinearGradient
extension LinearGradient {
  static var blue: Self { verticalGradient(with: [.lightBlue, .blue]) }
  static var orange: Self { verticalGradient(with: [.lightOrange, .orange]) }
  static var green: Self { verticalGradient(with: [.lightGreen, .green]) }
  static var teal: Self { verticalGradient(with: [.lightTeal, .teal]) }

  private static func verticalGradient(with colors: [Color]) -> Self {
    let gradient = Gradient(colors: colors)
    return LinearGradient(
      gradient: gradient,
      startPoint: UnitPoint(x: 0.0, y: 0.0),
      endPoint: UnitPoint(x: 0.0, y: 1.0))
  }
}

// MARK: - UIColor
extension UIColor {
  var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
    var hue: CGFloat = 0.0
    var saturation: CGFloat = 0.0
    var brightness: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
    return (hue, saturation, brightness, alpha)
  }

  func colorWithOffsets(
    hue: CGFloat = 0.0,
    saturation: CGFloat = 0.0,
    brightness: CGFloat = 0.0,
    alpha: CGFloat  = 0.0) -> UIColor {
      UIColor(
        hue: hsba.hue + hue,
        saturation: hsba.saturation + saturation,
        brightness: hsba.brightness + brightness,
        alpha: hsba.alpha + alpha
      )
    }
}

// MARK: - View
extension View {
  func blueStyle() -> some View {
    modifier(Style(gradient: .blue))
  }

  func tealStyle() -> some View {
    modifier(Style(gradient: .teal))
  }

  func orangeStyle(filled: Bool = true) -> some View {
    modifier(Style(gradient: .orange, filled: filled))
  }

  func greenStyle(filled: Bool = true) -> some View {
    modifier(Style(gradient: .green, filled: filled))
  }
}
