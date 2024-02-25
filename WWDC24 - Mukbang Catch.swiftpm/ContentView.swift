//import SwiftUI
//
//struct ContentView: View {
//    @ObservedObject var gameData = GameData()
//    
////    @State  var cameraOverlay = true
////
////    @State var objectCount = 0
////
////    @State var showViewHowTo = false
////    @State var showViewAbout = false
////
////    @State var isShowingModal = false
////
////    @State private var overlayPoints: [CGPoint] = []
////    @StateObject private var gameData = GameData()
////
//    var body: some View {
//        ZStack{
//            
//            GameViewControllerRepresentable(gameData: gameData).ignoresSafeArea()
//            
//            if gameData.gameStart {
//                
//
//            }
//                Group{
//                    VStack(alignment: .center) {
//                        
//                        Text("Mukbang Catch")
//                            .font(.system(size: 48))
//                            .bold()
//                            .foregroundColor(.blue)
//                        
//                        ZStack {
//                            HStack {
//                                
//                                Button {
//                                    showViewAbout.toggle()
//                                } label: {
//                                    Text("📚")
//                                        .font(.largeTitle)
//                                }
//                                .buttonStyle(.bordered)
//                                .background(cameraOverlay == false ? .white : .clear)
//                                .cornerRadius(10)
//                                .foregroundColor(.black)
//                                .font(.largeTitle)
//                                .padding([.leading],10)
//                                
//                                .sheet(isPresented: $showViewAbout) {
//                                    AboutView()
//                                }
//                                .buttonStyle(.bordered)
//                                
//                                
//                                
//                                
//                                Spacer()
//                                
//                            }
//                            
//                            
//                            HStack{
////                                Image(uiImage: "⭐️".image(sizes: 150)!)
////                                    .padding([.leading],10)
//                            }
//                            HStack {
//                                Spacer()
//                                Button( "📷") {
//                                    self.cameraOverlay = !cameraOverlay
//                                }
//                                .buttonStyle(.bordered)
//                                .background(cameraOverlay == false ? .white : .clear)
//                                .cornerRadius(10)
//                                .font(.largeTitle)
//                                .padding([.trailing],10)
//                                
//                            }
//                        }.padding([.bottom],20)
//                        
//                        
//                        
//                        Button("Start") {
////                            gameData.start()
//                        }
//                        .buttonStyle(.bordered)
//                        .font(.largeTitle)
//                        .tint(.yellow)
//                        .frame(maxWidth: .infinity)
//                        .padding([.bottom],5)
//                        
//                        //                        Button("How To Play") {
//                        Button {
//                            showViewHowTo.toggle()
//                        } label: {
//                            Text("How To Play")
//                                .font(.largeTitle)
//                        }
//                        .buttonStyle(.bordered)
//                        
//                        .sheet(isPresented: $showViewHowTo) {
//                            HowToView()
//                        }
//                        .buttonStyle(.bordered)
//                        .tint(.yellow)
//                        
//                        Spacer()
//                        
//                    }.padding([.top],50)
//                    
//                }
//                
//                
//            
//        }
//    }
//    
//}
