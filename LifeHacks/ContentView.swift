//
//  ContentView.swift
//  LifeHacks
//
//  Created by Jody Abney on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      QuestionView(question: TestData.question)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
