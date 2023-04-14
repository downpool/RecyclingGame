import SwiftUI

struct ContentView: View {
    @State var bookCount: Int = 0
    @State var isDrop: Bool = false
//    @State var timer: Timer
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                // MARK: drop center = x: 750, y: 50
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .clipped()
                
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 170, height: 100)
                    .foregroundColor(.white)
                    .position(x: 300, y: 110)
                
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 230, height: 170)
                    .foregroundColor(.white)
                    .position(x: 200, y: 140)
                
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .frame(width: 150, height: 100)
                    .foregroundColor(.white)
                    .position(x: 100, y: 80)
                
                // MARK: block create here!
                
                
                HStack(spacing: 0) {
                    Image("woodbox")
                        .resizable()
                        .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                        .position(x: geo.size.width / 6, y: 700)
                    
                    Image("woodbox")
                        .resizable()
                        .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                        .position(x: geo.size.width / 6, y: 700)
                    
                    Image("woodbox")
                        .resizable()
                        .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                        .position(x: geo.size.width / 6, y: 700)
                }
                
                
                Text("can")
                    .bold()
                    .font(.system(size: 35))
                    .position(x: geo.size.width / 6, y: 700)
                
                Text("general")
                    .bold()
                    .font(.system(size: 30))
                    .position(x: geo.size.width / 2, y: 700)
                
                Text("bottle")
                    .bold()
                    .font(.system(size: 35))
                    .position(x: geo.size.width / 1.2, y: 700)
            }
        }
    }
}

func createTrash() -> Trash {
    
    let randomNumber: Int = Int.random(in: 0...2)
    let randomTrash: Trash
    switch (randomNumber) {
        case 0:
            randomTrash = Trash(type: .Can)
            break
            
        case 1:
            randomTrash = Trash(type: .Bottle)
            break
        
        case 2:
            randomTrash = Trash(type: .General)
            break
        
        default:
            randomTrash = Trash(type: .General)
            break
    }
    
    return randomTrash
}

func moveTrash(Trash: Trash) {
    
}

func dropTrash(Trash: Trash) {
    
    
}

func continueDrop(){
    
    
}

func runEngine() {
    /*
    while(!gameLose) {
        moveTrash()
        if(onTapGesture) {
            dropTrash()
            
            stackCalculate()
        }
     
        continueDrop()
    }
    */
}

func gameLose() -> Bool {
    
    return false
}

func stackCalculate() {
    
}

func checkingGravity() {
    
}

func collapsBook() {
    
}

struct Trash {
    let type: TrashType
    var mainPoint: Double
    let width: CGFloat
    let height: CGFloat
    let image: Image
    
    init(type: TrashType) {
        self.type = type
        switch type {
            case .Can:
                width = 120
                mainPoint = 60
                height = 40
            case .General:
                width = 100
                mainPoint = 50
                height = 25
            case .Bottle:
                width = 75
                mainPoint = 37.5
                height = 20
        }
    }
}


// MARK: books top pos is y: 110
enum TrashType: CaseIterable {
    case Can, General, Bottle
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
