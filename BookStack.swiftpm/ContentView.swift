import SwiftUI

struct ContentView: View {
    @State var bookCount: Int = 0
    @State var isDrop: Bool = false
    @State var isMoving: Bool = false
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
                
                //                Rectangle()
                //                    .frame(width: 10, height: 10)
                //                    .onAppear {
                //                        withAnimation(self.moveTrash, <#() throws -> Void#>)
                //                    }
                
                Button {
                    
                } label: {
                    Image("can")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .offset(x: isMoving ? -150 : 150, y: -200)
                        .animation(moveTrash)
                        .onAppear {
                            self.isMoving = true
                        }
                }
                
                
                
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
                
                Text("paper")
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



var moveTrash: Animation {
    Animation.linear(duration: 2)
        .repeatForever()
}

func dropTrash(Trash: Trash) {
    
    
}

func continueDrop(){
    
    
}

func runEngine() {
    /*
     while(!gameLose()) {
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

func checkRightTrash() {
    
}

struct Trash {
    let type: TrashType
    let image: Image
    
    init(type: TrashType) {
        self.type = type
        switch type {
            case .Can:
                image = Image("can")
            case .Paper:
                image = Image("paper")
            case .Bottle:
                image = Image("bottle")
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
                randomTrash = Trash(type: .Paper)
                break
                
            default:
                randomTrash = Trash(type: .Paper)
                break
        }
        
        return randomTrash
    }
}


// MARK: books top pos is y: 110
enum TrashType: CaseIterable {
    case Can, Paper, Bottle
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
