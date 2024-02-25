import Foundation

class GameData: ObservableObject {
    
    @Published var gameStart = false
    @Published var gameOver = false
    @Published var score = 0
    
}
