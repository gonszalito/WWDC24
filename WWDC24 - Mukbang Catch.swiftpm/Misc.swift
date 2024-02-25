import SceneKit

let foodObjects = [
    SCNScene.scene(withEmoji: "🌟"),
    SCNScene.scene(withEmoji: "🌟"),


]

let nonFoodObjects = [
//    SCNScene.scene(withEmoji: "🌟"),
    SCNScene.scene(withEmoji: "🔥")
]

struct BitMask {
    static var food = 1 << 0
    static var nonFood = 1 << 1
    static var mouth = 1 << 2
}
