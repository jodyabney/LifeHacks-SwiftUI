//
//  RoundImage.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/23/22.
//

import SwiftUI

struct RoundImage: View {
  let image: UIImage
  var borderColor: Color = .white

  var body: some View {
    Image(uiImage: image)
      .resizable()
      .clipShape(Circle())
      .overlay(Circle().stroke(borderColor, lineWidth: 2))
  }
}

struct RoundImage_Previews: PreviewProvider {
  static var previews: some View {
    RoundImage(image: TestData.user.avatar)
      .frame(width: 100, height: 100)
      .padding()
      .background(.black)
      .previewLayout(.sizeThatFits)
  }
}
