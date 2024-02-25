import SwiftUI

struct ARViewContainer: UIViewControllerRepresentable {

  func makeUIViewController(context: Context) -> ARViewController {
    let arView = ARViewController()
    return arView
  }

  func updateUIViewController(
    _ uiViewController: ARViewController,
    context: Context
  ) {
  }
}
