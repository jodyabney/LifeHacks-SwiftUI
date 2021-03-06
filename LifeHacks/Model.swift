//
//  Model.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/17/22.
//

import Foundation
import UIKit

struct User: Equatable {
  var name: String
  var aboutMe: String
  let reputation: Int
  var avatar: UIImage
}

struct Question {
  let viewCount: Int
  let title: String
  let body: String
  let creationDate: Date
  let tags: [String]
  let owner: User

  private(set) var score: Int
  private(set) var vote = Vote.none

  mutating func upvote() {
    cast(vote: .up)
  }

  mutating func downvote() {
    cast(vote: .down)
  }

  mutating func unvote() {
    score -= vote.rawValue
    vote = .none
  }
}

extension Question {
  enum Vote: Int {
    case none = 0
    case up = 1
    case down = -1
  }
}

private extension Question {
  mutating func cast(vote: Vote) {
    guard self.vote != vote else { return }
    unvote()
    score += vote.rawValue
    self.vote = vote
  }
}
