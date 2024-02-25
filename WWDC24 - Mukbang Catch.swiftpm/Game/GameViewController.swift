import SwiftUI
import ARKit
import SceneKit
import AVFoundation
import SpriteKit

struct GameViewControllerRepresentable: UIViewControllerRepresentable {
    @ObservedObject var gameData: GameData
    
    class Coordinator: GameViewControllerDelegate {
        var gameData: GameData
        
        init(gameData: GameData){
            self.gameData = gameData
        }
        
        var gameStart = false {
            didSet {
                gameData.gameStart = gameStart
            }
        }
        
        var gameOver = false {
            didSet {
                gameData.gameOver = gameOver
            }
        }
        
        var score = 0 {
            didSet {
                gameData.score = score
                
            }
        }
    }
    
    func makeUIViewController(context: Context) -> some GameViewController {
        let gameViewControler = GameViewController()
        gameViewControler.delegate = context.coordinator
        return gameViewControler
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(gameData: gameData)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

protocol GameViewControllerDelegate {
    var gameStart: Bool {get set}
    var gameOver: Bool {get set}
    var score : Int {get set}
}

class GameViewController: UIViewController {
    var delegate: GameViewControllerDelegate!
    
    var arView : ARSCNView!
    var skView : SKView!
    
    var anchorNode: SCNNode?
    var lastTouched: SCNNode?
    
    var munchSFX : AVAudioPlayer!
//    var munchEmitterNode = SKEmitterNode(fileNamed: "munch.sks")!
//    let particleNode = SCNNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        munchEmitterNode.name = "munch"
//        particleNode.addParticleSystem(SCNParticleSystem(named: "munch", inDirectory: nil))
        
        let munchSFXPath = Bundle.main.path(forResource: "munch", ofType: "mp3")!
        munchSFX = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: munchSFXPath))
        munchSFX.prepareToPlay()
        
        arView = ARSCNView(frame: view.frame)
        arView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        arView.delegate = self
        
        skView = SKView(frame: view.frame)
        skView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        skView.allowsTransparency = true
        skView.backgroundColor = .clear
        
        view.addSubview(arView)
        view.addSubview(skView)
        
        let scene = SKScene(size: view.frame.size)
        scene.backgroundColor = .clear
//        munchParticle.targetNode = scene
//
//        scene.addChild(munchParticle)
        skView.presentScene(scene)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let config = ARFaceTrackingConfiguration()
        
        arView.session.run(config)
        arView.session.delegate = self
        
        arView.scene.physicsWorld.gravity.y = -1
        arView.scene.physicsWorld.contactDelegate = self
    }
    
    func startGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.spawnObject()
        }
       
    }
    
    @objc func spawnObject() {
        guard !delegate.gameOver else {return}
        
        let isFood = Int.random(in: 1...10) > 3
        let objectsToSpawn = isFood ? foodObjects : nonFoodObjects
        guard let object = objectsToSpawn.randomElement()?.rootNode.clone() else {return}
        
        object.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        object.physicsBody?.categoryBitMask = isFood ? BitMask.food : BitMask.nonFood
        object.physicsBody?.collisionBitMask = BitMask.mouth
        
        object.physicsBody?.applyForce(SCNVector3(
            1,
            1,
            1
        ), asImpulse: true)
        
        anchorNode?.addChildNode(object)
        
        object.position = SCNVector3(
            1,
            1,
            1
        )
        
        
        Timer.scheduledTimer(timeInterval: .random(in: 1...3), target: self, selector: #selector(spawnObject), userInfo: nil, repeats: false)
    }
    
    let noseOptions = ["nose01", "nose02", "nose03", "nose04", "nose05", "nose06", "nose07", "nose08", "nose09"]
    let features = ["nose"]
    var featureIndices = [[6]]
    
    
    func updateFeatures(for node: SCNNode, using anchor: ARFaceAnchor) {
//        print(featureIndices)
//        for (feature, indices) in zip(features, featureIndices) {
//            let child = node.childNode(withName: feature, recursively: false) as? FaceNode
//            let vertices = indices.map { anchor.geometry.vertices[$0] }
//            child?.updatePosition(for: vertices)
//        }
        
        
    
        
    }
    
}


