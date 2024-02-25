//import SwiftUI
//import ARKit
//import SceneKit
//
//extension GameViewController: ARSCNViewDelegate {
//    
//    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
//        
//        let device: MTLDevice!
//        device = MTLCreateSystemDefaultDevice()
//        guard let faceAnchor = anchor as? ARFaceAnchor else {
//            return nil
//        }
//        let faceGeometry = ARSCNFaceGeometry(device: device)
//        let node = SCNNode(geometry: faceGeometry)
//        node.geometry?.firstMaterial?.fillMode = .fill
//        //node.geometry?.firstMaterial?.transparency = 0.0
////
////        let noseNode = FaceNode(with: noseOptions)
////        noseNode.name = "nose"
////        node.addChildNode(noseNode)
//        
////        updateFeatures(for: node, using: faceAnchor)
////        detectCollision()
//        
//        return node
//    }
//    
//    func renderer(
//        _ renderer: SCNSceneRenderer,
//        didUpdate node: SCNNode,
//        for anchor: ARAnchor) {
//        guard let faceAnchor = anchor as? ARFaceAnchor,
//            let faceGeometry = node.geometry as? ARSCNFaceGeometry else {
//                return
//        }
//        
//        faceGeometry.update(from: faceAnchor.geometry)
////        updateFeatures(for: node, using: faceAnchor)
//    }
//    
//}
//
//
//// Mouth Interaction
//extension GameViewController: ARSessionDelegate {
////    // Inside your SceneKit view controller
////
////    // Implement touch handling
////    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        guard let touch = touches.first else { return }
////
////        // Convert touch location to 3D point
////        let location = touch.location(in: skView)
////        let hitTestResults = skView.hitTest(location, with: nil)
////
////        for result in hitTestResults {
////            // Check if the touched node is your object
////            if result.node == yourObjectNode {
////                // Check intersection with mouth position
////                let touchPoint = SCNVector3(result.worldCoordinates)
////                let distance = calculateDistance(from: touchPoint, to: mouthPosition)
////
////                // If distance is within threshold, it's a hit
////                if distance < threshold {
////                    // Perform action (e.g., eat the object)
////                }
////            }
////        }
////    }
////
////    // Function to calculate distance between two SCNVector3 points
////    func calculateDistance(from point1: SCNVector3, to point2: SCNVector3) -> Float {
////        let dx = point2.x - point1.x
////        let dy = point2.y - point1.y
////        let dz = point2.z - point1.z
////        return sqrt(dx*dx + dy*dy + dz*dz)
////    }
//}
//
//extension GameViewController: SCNPhysicsContactDelegate {
//    
//}
