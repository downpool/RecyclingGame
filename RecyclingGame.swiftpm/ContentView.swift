import SwiftUI
import Combine

struct ContentView: View {
    @State var trashObject: Trash = Trash()
    @State var leftTime: Double = 0.0
    @State var leftLife: Double = 0.0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(width: 300, height: 300)
                        .cornerRadius(40)
                    
                    Image(trashObject.getType())
                        .resizable()
                        .frame(width: 250, height: 250)
                        .background(.white)
                        .cornerRadius(40)
                    
                    VStack {
                        
                        ProgressView("Life", value: leftLife, total: 10)
                            .padding()
                            .position(x: 215, y: 20)
                            .progressViewStyle(LinearProgressViewStyle(tint: leftLife < 8 ? .blue : .red))
                        
                        ProgressView("Left Time!", value: leftTime, total: 10)
                            .padding()
                            .position(x: 215, y: 25)
                            .progressViewStyle(LinearProgressViewStyle(tint: leftTime < 7 ? .blue : .red))
                        
                        
                        
                        
                        Spacer(minLength: 630)
                        HStack(spacing: 0) {
                            
                            Button {
                                print("Can")
                                if(trashObject.getType() == "can") {
                                    print("O")
                                }else{
                                    print("x")
                                    leftLife += 1
                                }
                                leftTime = 0
                                trashObject = Trash()
                            } label: {
                                Text("can")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.system(size: 35))
                                    .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                            }
                            
                            .background(Image("woodbox")
                                .resizable()
                                .frame(width: geo.size.width / 3, height: geo.size.width / 3))
                            
                            
                            Button {
                                print("Paper")
                                if(trashObject.getType() == "paper") {
                                    print("O")
                                }else{
                                    print("x")
                                    leftLife += 1
                                }
                                trashObject = Trash()
                                leftTime = 0
                                
                            } label: {
                                Text("paper")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.system(size: 35))
                                    .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                            }
                            
                            .background(Image("woodbox")
                                .resizable()
                                .frame(width: geo.size.width / 3, height: geo.size.width / 3))
                            
                            
                            
                            
                            Button {
                                print("Bottle")
                                if(trashObject.getType() == "bottle") {
                                    print("O")
                                }else{
                                    print("x")
                                    leftLife += 1
                                }
                                trashObject = Trash()
                                leftTime = 0
                                
                            } label: {
                                Text("bottle")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.system(size: 35))
                                    .frame(width: geo.size.width / 3, height: geo.size.width / 3)
                            }
                            
                            .background(Image("woodbox")
                                .resizable()
                                .frame(width: geo.size.width / 3, height: geo.size.width / 3))
                            
                        }
                    }
                    .onReceive(timer) { _ in
                        
                        if leftTime < 10 {
                            leftTime += 1
                        }
                        if leftTime >= 10 {
                            leftLife += 1
                            leftTime = 0
                        }
                        if leftLife >= 10 {
                            gameLose()
                        }
                    }
                }
            }
        }
    }
}


var timer: Timer?
var timerNum: Int = 0


func makeTrash(isDropping: Bool) -> any View {
    
    let trash: String = Trash().getType()
    
    
    return Image(trash)
        .resizable()
        .frame(width: 100, height: 100)
        .position(x: 180, y: 200)
}

//struct lifeProgressViewStyle: ProgressViewStyle {
//    var
//}

func isRightType() {
    
    
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
    
    init() {
        
        let randomNumber: Int = Int.random(in: 0...2)
        switch (randomNumber) {
            case 0:
                self.type = .Can
                self.image = Image("can")
                break
                
            case 1:
                self.type = .Bottle
                self.image = Image("bottle")
                break
                
            case 2:
                self.type = .Paper
                self.image = Image("paper")
                break
                
            default:
                self.type = .Paper
                self.image = Image("image")
                break
        }
    }
    
    
    func getType() -> String {
        switch type {
            case .Bottle:
                return "bottle"
            case .Can:
                return "can"
            case .Paper:
                return "paper"
        }
    }
}


// MARK: trashType define
enum TrashType: CaseIterable {
    case Can, Paper, Bottle
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
