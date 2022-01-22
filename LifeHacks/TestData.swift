//
//  TestData.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/21/22.
//

import Foundation
import UIKit

struct TestData {
  static let user = User(
    name: "Betty Vasquez",
    aboutMe: "The monkey-rope is found in all whalers; but it was only in the Pequod that the monkey and his holder " +
    " were ever tied together. This improvement upon the original usage was introduced by no less a man than Stubb, " +
    "in order to afford the imperilled harpooneer the strongest possible guarantee for the faithfulness " +
    "and vigilance of his monkey-rope holder.",
    reputation: 1234,
    avatar: UIImage()
  )

  static let question = Question(
    viewCount: 2770,
    title:
    "In the tumultuous business of cutting-in and attending to a whale, there is much running backwards " +
    "and forwards among the crew.",
    body: "So strongly and metaphysically did I conceive of my situation then, that while earnestly watching his " +
    "motions.nnI seemed distinctly to perceive that my own individuality was now merged in a joint stock company " +
    "of two; that my free will had received a mortal wound; and that another's mistake or misfortune might plunge " +
    "innocent me into unmerited disaster and death.",
    creationDate: Date(),
    tags: ["monkey", "rope", "found", "all", "whalers"],
    owner: user,
    score: 359
  )
}
