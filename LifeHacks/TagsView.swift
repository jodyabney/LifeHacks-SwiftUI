//
//  TagsView.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/22/22.
//

import SwiftUI

struct TagsView: View {
  let tags: [String]

  var body: some View {
    Text(tagString)
      .font(.footnote)
      .fontWeight(.semibold)
      .foregroundColor(.blue)
  }
}

extension TagsView {
  var tagString: String {
    var result = tags.first ?? ""
    for tag in tags.dropFirst() {
      result.append(", " + tag)
    }
    return result
  }
}

struct TagsView_Previews: PreviewProvider {
  static var previews: some View {
    TagsView(tags: ["lorem", "ipsum", "dolor", "sit", "amet"])
      .previewLayout(.sizeThatFits)
  }
}
