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
    @State private var selectedSecs = 20
    
    @State private var opacityAnim = 1.0
    @State private var exercises: [Exercise] = [
        Exercise(name: 1, duration: 10, position: 1300, offImage: UIImage(named:"a-off" )!, onImage: "a"),
        Exercise(name: 2, duration: 10, position: 1300, offImage: UIImage(named:"b-off" )!, onImage: "b"),
        Exercise(name: 3, duration: 10, position: 1300, offImage: UIImage(named:"c-off" )!, onImage: "c"),
        Exercise(name: 4, duration: 10, position: 1300, offImage: UIImage(named:"d-off" )!, onImage: "d"),
        Exercise(name: 5, duration: 10, position: 1300, offImage: UIImage(named:"e-off" )!, onImage: "e"),
        Exercise(name: 6, duration: 10, position: 1300, offImage: UIImage(named:"f-off" )!, onImage: "f"),
        Exercise(name: 7, duration: 10, position: 1300, offImage: UIImage(named:"g-off" )!, onImage: "g"),
        Exercise(name: 8, duration: 10, position: 1300, offImage: UIImage(named:"h-off" )!, onImage: "h"),
        Exercise(name: 9, duration: 10, position: 1300, offImage: UIImage(named:"i-off" )!, onImage: "i")
    ]
    @State private var turn = 0
    @State private var yellowTurn = 0
    @State private var blueSecs = 0
    
    private let serialQueue = DispatchQueue(label: "com.aboveground.dispatchqueueml")
    private var visionRequests = [VNRequest]()
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
                
                Image("background")
                    .position(x:980, y: 390)
                VStack{
                    
                    Text("\(self.selectedSecs)")
                        .onReceive(timer){_ in
                            self.selectedSecs += 1
                            
                            if self.selectedSecs % 25 == 0{
                                withAnimation(.easeIn(duration: 5.0)){self.yellowTurn += 1}
                                blueSecs = self.selectedSecs
                                
                            }
                            
                            if self.selectedSecs == blueSecs + 5 {
                                withAnimation(.easeIn(duration: 0.5)){self.turn += 1}
                            }
                            
                        }
                        .foregroundColor(arViewModel.tiltLeft ? .green : .secondary)
                    NavigationLink(destination: GamesListView()) {
                        Image("back-button")
                            .position(x:70, y: 30)
                    }
                    
                    ZStack{
                        
                        ForEach(exercises){item in
                            ZStack{
                                Image("yellow-rectangle")
                                    .scaledToFit()
                                //                                    .opacity((turn >= item.name ? 1.0 : 0.0))
                                Image(uiImage: item.offImage)
                                    .frame(width: 10, height: 50)
                                //                                    .opacity((turn >= item.name ? 1.0 : 0.0))
                            }
                            .frame(width: 10, height: 10)
                            .position(x: ((self.yellowTurn >= item.name) ? (item.position - 1160) : item.position), y: 250)
                            
                            
                        }
                        
                        Image("rectangle")
                            .position(x:145, y: 250)
                        
                        ZStack{
                            GifImage(exercises[0].onImage)
                                .opacity((turn >= exercises[0].name ? 1.0 : 0.0))
                            
                            GifImage(exercises[1].onImage)
                                .opacity((turn >= exercises[1].name ? 1.0 : 0.0))
                            
                            GifImage(exercises[2].onImage)
                                .opacity((turn >= exercises[2].name ? 1.0 : 0.0))
                            
                            GifImage(exercises[3].onImage)
                                .opacity((turn >= exercises[3].name ? 1.0 : 0.0))
                            
                            GifImage(exercises[4].onImage)
                                .opacity((turn >= exercises[4].name ? 1.0 : 0.0))

                            GifImage(exercises[5].onImage)
                                .opacity((turn >= exercises[5].name ? 1.0 : 0.0))
                            
                            GifImage(exercises[6].onImage)
                                .opacity((turn >= exercises[6].name ? 1.0 : 0.0))
                            
                            GifImage(exercises[7].onImage)
                                .opacity((turn >= exercises[7].name ? 1.0 : 0.0))
                            
                            GifImage(exercises[8].onImage)
                                .opacity((turn >= exercises[8].name ? 1.0 : 0.0))
                                            
                            
                            
                        }.position(x:-347, y: 170)
                            .frame(width: 220, height: 220)
                        
                        
                        //                        switch turn{
                        //                        case 0:
                        //                            Image("a-off")
                        //                        case 1:
                        //                            GifImage(exercises[0].onImage)
                        //                                .position(x:-347, y: 170)
                        //                                .frame(width: 220, height: 220)
                        //                        case 2:
                        //                            GifImage(exercises[1].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        case 3:
                        //                            GifImage(exercises[2].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        case 4:
                        //                            GifImage(exercises[3].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        case 5:
                        //                            GifImage(exercises[4].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        case 6:
                        //                            GifImage(exercises[5].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        case 7:
                        //                            GifImage(exercises[6].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        case 8:
                        //                            GifImage(exercises[7].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        case 9:
                        //                            GifImage(exercises[8].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        default:
                        //                            GifImage(exercises[0].onImage)
                        //                                .position(x:-360, y: 160)
                        //                                .frame(width: 200, height: 200)
                        //                        }
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
