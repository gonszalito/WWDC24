import SceneKit

extension SCNScene {
    static func scene(withEmoji emoji: String) -> SCNScene {
        // Create an SCNScene
        let scene = SCNScene()

        // Create a sphere geometry
        let sphereGeometry = SCNSphere(radius: 1.0)

        // Create an SCNMaterial with the emoji texture
        let material = SCNMaterial()
        material.diffuse.contents = emoji // Use the emoji as texture
        sphereGeometry.materials = [material]

        // Create an SCNNode with the sphere geometry
        let sphereNode = SCNNode(geometry: sphereGeometry)

        // Add the sphere node to the scene
        scene.rootNode.addChildNode(sphereNode)

        return scene
    }
}
