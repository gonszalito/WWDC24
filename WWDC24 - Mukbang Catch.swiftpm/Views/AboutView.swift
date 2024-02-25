import SwiftUI
struct AboutView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Button {
                  presentationMode.wrappedValue.dismiss()

                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
            }
            
            VStack {
                Text("This Swift Playgrounds Game was made using Vision and works by detecting the players hand along with the coordinates of the tip relatice to the wrist and so with that we can measure how far they are apart and thus only count the fingers which tip has a minimum range not smaller than 20 pixels to the wrist")
                    .foregroundColor(.black)
                    .font(.title2)
                Spacer()
            }.padding([.top],75)
                .padding([.leading,.trailing], 20)
        }
    }
}
