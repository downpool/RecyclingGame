import SwiftUI

struct ContentView: View {
    @State var bookCount: Int = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.linearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom))
            
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 170, height: 100)
                .foregroundColor(.white)
                .position(x: 670, y: 50)
            
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 230, height: 170)
                .foregroundColor(.white)
                .position(x: 750, y: 50)
            
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 150, height: 100)
                .foregroundColor(.white)
                .position(x: 850, y: 50)
            
            Image("background")
                .resizable()
                .frame(width: 1500, alignment: .center)
            VStack {
                
            }
        }
    }
}

func dropBook() {
    
    
}

enum BookType {
    case Large, Big, Middle, Small
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
