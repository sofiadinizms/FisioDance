//
//  UserFeedbackView.swift
//  FisioDance
//
//  Created by mcor on 05/04/23.
//

import SwiftUI

enum Feedback: Int, CaseIterable {
    case impossible = 1
    case hard = 2
    case neutral = 3
    case fine = 4
    case easy = 5
    
    var emoji: String {
        switch self {
        case .impossible:
            return "😭"
        case .hard:
            return "🥵"
        case .neutral:
            return "😐"
        case .fine:
            return "🙂"
        case .easy:
            return "😍"
        }
    }
}

class FeedbackManager {
    static let shared = FeedbackManager()
    
    var feedback: Feedback? {
        let defaults = UserDefaults.standard
        let feedbackValue = defaults.integer(forKey: "feedback")
        return Feedback(rawValue: feedbackValue)
    }
}

struct UserFeedbackView: View {
    @State private var selectedFeedback = Feedback.neutral
    
    var body: some View {
        VStack {
//            Text("Qual foi seu nível de dificuldade em realizar este exercício?")
//                //.font(.title2)
//                .font(.custom("Jura", size: 24))
//                .foregroundColor(Color("dark-blue90"))
            
            HStack {
                ForEach(Feedback.allCases, id: \.self) { feedback in
                    Button(action: {
                        self.selectedFeedback = feedback
                        saveFeedback()
                    }) {
                        Text(feedback.emoji)
                            .font(.largeTitle)
                    }
                    .buttonStyle(FeedbackButtonStyle(selectedFeedback: self.selectedFeedback, feedback: feedback))
                }
            }
            
        }
    }
    
    
    func saveFeedback() {
        let defaults = UserDefaults.standard
        defaults.set(selectedFeedback.rawValue, forKey: "feedback")
    }
}

struct FeedbackButtonStyle: ButtonStyle {
    let selectedFeedback: Feedback
    let feedback: Feedback
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(selectedFeedback == feedback ? Color("dark-blue90") : Color("light-blue20"))
            .cornerRadius(10)
    }
}

struct UserFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        UserFeedbackView()
    }
}
