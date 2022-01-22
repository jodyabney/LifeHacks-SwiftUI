//
//  QuestionView.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/21/22.
//

import SwiftUI

struct QuestionView: View {
  let title: String
  let viewCount: Int
  let date: Date
  let tags: [String]

  var body: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      Text(title)
        .font(.headline)
      Text(tagString)
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundColor(.blue)
      Group {
        Text("Asked on \(date.formatted)")
        Text("Viewed \(viewCount.formatted()) times")
      }
      .font(.caption)
      .foregroundColor(.secondary)
    }
  }
}

private extension QuestionView {
  var tagString: String {
    var result = tags.first ?? ""
    for tag in tags.dropFirst() {
      result.append(", " + tag)
    }
    return result
  }
}

struct QuestionView_Previews: PreviewProvider {
  static let question = TestData.question

  static var previews: some View {
    QuestionView(
      title: question.title,
      viewCount: question.viewCount,
      date: question.creationDate,
      tags: question.tags)
  }
}
