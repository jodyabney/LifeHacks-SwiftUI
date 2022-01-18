//
//  LifeHacksTests.swift
//  LifeHacksTests
//
//  Created by Jody Abney on 1/17/22.
//

import XCTest
@testable import LifeHacks

class QuestionTests: XCTestCase {

  func testUpvote() throws {
    var question = makeQuestion()
    question.upvote()
    XCTAssertEqual(question.score, 1)
  }

  func testDownvote() throws {
    var question = makeQuestion()
    question.downvote()
    XCTAssertEqual(question.score, -1)
  }

  func testReversingVote() {
    var question = makeQuestion()
    question.upvote()
    question.downvote()
    XCTAssertEqual(question.score, -1)
  }
}

private extension QuestionTests {
  func makeQuestion() -> Question {
    let user = User(name: "", aboutMe: "", reputation: 0, avatar: UIImage())
    return Question(viewCount: 0, title: "", body: "", creationDate: Date(), tags: [], owner: user, score: 0)
  }
}
