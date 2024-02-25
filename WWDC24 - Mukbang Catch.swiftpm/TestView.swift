import SwiftUI

struct TestView: View {
    @ObservedObject var gameData = GameData()
    
 
    var body: some View {
        ZStack{
            
            GameViewControllerRepresentable(gameData: gameData)
                .ignoresSafeArea()
            
            if gameData.gameStart{
                VStack {
                    Text("Score: \(gameData.score)")
                        .font(.title)
                    Spacer()
                    
                    if gameData.gameOver {
                        Text("Game Over")
                            .font(.system(size: 60))
                            .bold()
                            .foregroundColor(.red)
                    }
                }
            }
            
        
        }
    }
}
