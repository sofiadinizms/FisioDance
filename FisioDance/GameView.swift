//
//  GameView.swift
//  FisioDance
//
//  Created by sofiadinizms on 20/03/23.
//
//
//  ContentView.swift
//  cameraApp
//
//  Created by sofiadinizms on 08/04/23.
//

import SwiftUI
import RealityKit
import ARKit

struct GameView : View {
    
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var selectedSecs = 15
    @State private var opacityAnim = 1.0
    @State private var exercises: [Exercise] = [
        Exercise(name: 1, duration: 10, position: 700),
        Exercise(name: 2, duration: 10, position: 700),
        Exercise(name: 3, duration: 10, position: 700),
        Exercise(name: 4, duration: 10, position: 700),
        Exercise(name: 5, duration: 10, position: 700)
    ]
    @State private var turn = 0
    
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
                HStack{
                    
                    Text("\(self.selectedSecs)")
                        .onReceive(timer){_ in
                            self.selectedSecs += 1
                            
                            if self.selectedSecs % 30 == 0 {
                                withAnimation(.easeIn(duration: 5.0)){self.turn += 1}
                            }
                        }
                        .foregroundColor(arViewModel.tiltLeft ? .green : .secondary)
                    NavigationLink(destination: GamesListView()) {
                        Image("back-button")
                    }
                    
                    ZStack{
                        Image("rectangle")
                            .position(x:220, y: 220)
                        
                        ForEach(exercises){item in
                            ZStack{
                                Image("yellow-rectangle")
                                    .scaledToFit()
                                    .opacity((turn >= item.name ? 0.0 : 1.0))
                                Image(systemName: "star.fill").frame(width: 50, height: 50)
                                    .opacity(opacityAnim)
                            }
                            .frame(width: 10, height: 10)
                            .position(x: (turn >= item.name ? (item.position - 480) : item.position), y: 200)
                            
                            
                        }
                        
                    }
                    
                }
            }
            
            
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    var arViewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct GameView_Previews : PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
#endif
