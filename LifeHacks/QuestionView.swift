//
//  QuestionView.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/21/22.
//

import SwiftUI

// MARK: QuestionView
struct QuestionView: View {
  let question: Question

  var body: some View {
    VStack(alignment: .leading, spacing: 24.0) {
      HStack(alignment: .top, spacing: 16.0) {
        Voting(score: question.score)
        Info(
          title: question.title,
          viewCount: question.viewCount,
          date: question.creationDate,
          tags: question.tags)
      }
      Text(question.body)
        .font(.subheadline)
      HStack {
        Spacer()
        Owner(
          name: question.owner.name,
          reputation: question.owner.reputation,
          avatar: question.owner.avatar)
      }
      Spacer()
    }
    .padding()
  }
}

// MARK: - Owner
extension QuestionView.Owner {
  init(user: User) {
    name = user.name
    reputation = user.reputation
    avatar = user.avatar
  }
}

extension QuestionView {
  struct Owner: View {
    let name: String
    let reputation: Int
    let avatar: UIImage

    var body: some View {
      HStack {
        RoundImage(image: avatar)
          .frame(width: 48.0, height: 48.0)
        VStack {
          Text(name)
            .font(.headline)
          Text("\(reputation.formatted()) reputation")
            .font(.caption)
        }
      }
      .padding(16)
      .blueStyle()
    }
  }
}

// MARK: - Info
extension QuestionView {
  struct Info: View {
    let title: String
    let viewCount: Int
    let date: Date
    let tags: [String]

    var body: some View {
      VStack(alignment: .leading, spacing: 8.0) {
        Text(title)
          .font(.headline)
        TagsView(tags: tags)
        Group {
          Text("Asked on \(date.formatted)")
          Text("Viewed \(viewCount.formatted()) times")
        }
        .font(.caption)
        .foregroundColor(.secondary)
      }
    }
  }
}

// MARK: - Voting
extension QuestionView {
  struct Voting: View {
    let score: Int

    var body: some View {
      VStack(spacing: 8.0) {
        VoteButton(buttonType: .up, highlighted: false)
        Text("\(score)")
          .font(.title)
          .foregroundColor(.secondary)
        VoteButton(buttonType: .down, highlighted: false)
      }
    }
  }
}

// MARK: - VoteButton
extension QuestionView.Voting {
  struct VoteButton: View {
    let buttonType: ButtonType
    let highlighted: Bool

    var body: some View {
      Button(action: {}) {
        buttonType.image(highlighted: highlighted)
          .resizable()
          .frame(width: 32, height: 32)
          .foregroundColor(.orange)
      }
    }
  }
}

extension QuestionView.Voting.VoteButton {
  enum ButtonType: String {
    case up = "arrowtriangle.up"
    case down = "arrowtriangle.down"

    func image(highlighted: Bool) -> Image {
      let imageName = rawValue + (highlighted ? ".fill" : "")
      return Image(systemName: imageName)
    }
  }
}

// MARK: - Previews
struct QuestionView_Previews: PreviewProvider {
  static let question = TestData.question
  static let user = TestData.user

  static var previews: some View {
    Group {
      QuestionView(question: question)
      QuestionView(question: question)
        .background(Color(.systemBackground))
        .environment(\.colorScheme, .dark)
        .previewDisplayName("Dark mode")
      QuestionView(question: question)
        .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        .previewDisplayName("Accessibility XXXL")
      QuestionView(question: question)
        .previewDevice("iPhone SE")
        .previewDisplayName("iPhone SE")
      Group {
        QuestionView.Info(
          title: question.title,
          viewCount: question.viewCount,
          date: question.creationDate,
          tags: question.tags)
          .previewDisplayName("Info")
        QuestionView.Voting(score: question.score)
          .previewDisplayName("Voting")
        HStack(spacing: 36) {
          QuestionView.Voting.VoteButton(buttonType: .up, highlighted: true)
          QuestionView.Voting.VoteButton(buttonType: .up, highlighted: false)
          QuestionView.Voting.VoteButton(buttonType: .down, highlighted: true)
          QuestionView.Voting.VoteButton(buttonType: .down, highlighted: false)
        }
        .previewDisplayName("Vote button configurations")
        QuestionView.Owner(
          name: user.name,
          reputation: user.reputation,
          avatar: user.avatar)
          .padding()
          .previewDisplayName("Owner")
      }
      .previewLayout(.sizeThatFits)
    }
  }
}
