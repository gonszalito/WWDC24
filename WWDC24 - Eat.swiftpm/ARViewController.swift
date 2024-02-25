//
//  ARViewController.swift
//  WWDC24 - Eat
//
//  Created by Jonathan Andryana on 25/02/24.
//

import Foundation
import UIKit
import ARKit
import SceneKit

class ARViewController: UIViewController {
    
    
    var appleNode: SCNNode?

    func throwApple() {
        // Create a sphere geometry for the apple
        let radius: CGFloat = 1
        let appleGeometry = SCNSphere(radius: radius)
        appleNode = SCNNode(geometry: appleGeometry)
        
        // Add physics to the apple
        let physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        appleNode?.physicsBody = physicsBody
        
        // Set initial position and throw the apple
        appleNode?.position = SCNVector3(x: 0, y: 0.5, z: -10) // Initial position
        appleNode?.physicsBody?.applyForce(SCNVector3(x: 0, y: 5, z: -10), asImpulse: true) // Apply throwing force
        
        // Add the apple node to the scene
        arView.scene.rootNode.addChildNode(appleNode!)
    }

    func detectCollision() {
        guard let appleNode = appleNode,
              let faceAnchor = arView.session.currentFrame?.anchors.compactMap({ $0 as? ARFaceAnchor }).first else {
            return
        }
        
        // Get the position of the detected mouth
        let mouthPosition = SCNVector3(faceAnchor.geometry.vertices[14]) // Adjust the index as needed
        
        
//        let applenodePosition = SCNVector3(x: Float(appleNode.position), y: 0, z: 0)
        // Check distance between the apple and the mouth position
        let distance = compareSCN3(left: appleNode.position, right: appleNode.position)
        if distance.x >= -5 && distance.x <= 5 &&
           distance.y >= -5 && distance.y <= 5 &&
           distance.z >= -5 && distance.z <= 5 {
//            appleNode.removeFromParentNode()
            print("eaten")
        }
        
    }
    
    func compareSCN3(left: SCNVector3, right: SCNVector3) -> SCNVector3 {
        return SCNVector3(left.x - right.x, left.y - right.y, left.z - right.z)
    }



    
    
    var arView : ARSCNView!
    
    let noseOptions = ["nose01", "nose02", "nose03", "nose04", "nose05", "nose06", "nose07", "nose08", "nose09"]
    let features = ["nose"]
    var featureIndices = [[6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView = ARSCNView(frame: view.frame)
        arView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        arView.delegate = self
        
        
        view.addSubview(arView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        arView.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        throwApple()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let config = ARFaceTrackingConfiguration()
        
        arView.session.run(config)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        arView.session.pause()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
          let location = sender.location(in: arView)
          let results = arView.hitTest(location, options: nil)
          if let result = results.first,
             
              let node = result.node as? FaceNode {
              node.next()
          }
      }
    
    func updateFeatures(for node: SCNNode, using anchor: ARFaceAnchor) {
        print(featureIndices)
        for (feature, indices) in zip(features, featureIndices) {
            let child = node.childNode(withName: feature, recursively: false) as? FaceNode
            let vertices = indices.map { anchor.geometry.vertices[$0] }
            child?.updatePosition(for: vertices)
        }
        
        
    }
    
    
    
}


extension ARViewController: ARSCNViewDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let device: MTLDevice!
        device = MTLCreateSystemDefaultDevice()
        guard let faceAnchor = anchor as? ARFaceAnchor else {
            return nil
        }
        let faceGeometry = ARSCNFaceGeometry(device: device)
        let node = SCNNode(geometry: faceGeometry)
                node.geometry?.firstMaterial?.fillMode = .lines
        //node.geometry?.firstMaterial?.transparency = 0.0
        
        let noseNode = FaceNode(with: noseOptions)
        noseNode.name = "nose"
        node.addChildNode(noseNode)
        
        updateFeatures(for: node, using: faceAnchor)
//        detectCollision()
        
        return node
    }
    
    func renderer(
        _ renderer: SCNSceneRenderer,
        didUpdate node: SCNNode,
        for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor,
            let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
                return
        }
        
        faceGeometry.update(from: faceAnchor.geometry)
        updateFeatures(for: node, using: faceAnchor)
    }
    
    
}
