import SwiftUI
import Combine

struct ContentView: View {
    @State var trashObject: Trash = Trash()
    @State var leftTime: Double = 0.0
    @State var leftLife: Double = 10
    @State var gameOver: Bool = false
    @State var gameOver2: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
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
                
                ZStack {
                    
                    Text("Stack\n    \(String(countStacks))\n Max\n    \(String(maxStack))")
                        .position(x: geo.size.width / 9, y: geo.size.height / 2)
                        .font(.system(size: 50))
                    
                    
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(width: 600, height: 600)
                        .cornerRadius(40)
                    
                    
                    makeTrash(trash: trashObject)
                        .alert(isPresented: $gameOver2) {
                            Alert(title: Text("You lose.."), message: Text("Your max stack is \(maxStack)"), dismissButton: .cancel())
                        }
                    
                    VStack {
                        Text("Life")
                            .font(.system(size: 30))
                            .position(x: geo.size.width / 2, y: 100)
                        
                        ProgressView( value: leftLife, total: 10)
                            .padding()
                            .position(x: geo.size.width / 2, y: 30)
                            .progressViewStyle(LinearProgressViewStyle(tint: leftLife > 4 ? .blue : .red))
                        
                        Text("Left Time!")
                            .font(.system(size: 30))
                            .position(x: geo.size.width / 2, y: 0)
                        ProgressView(value: leftTime, total: 10)
                            .padding()
                            .position(x: geo.size.width / 2, y: -70)
                            .progressViewStyle(LinearProgressViewStyle(tint: leftTime < 7 ? .blue : .red))

                        
                        Spacer(minLength: 630)
                        HStack(spacing: 0) {
                            
                            Button {
                                if !gameOver {
                                    if !matchTrash(answer: trashObject, choose: "can") {
                                        leftLife -= 1
                                        countStacks = 0
                                    }else{
                                        countStacks += 1
                                        if maxStack <= countStacks {
                                            maxStack = countStacks
                                        }
                                    }
                                    leftTime = 0
                                    trashObject = Trash()
                                }
                            } label: {
                                Text("can")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.system(size: 50))
                                    .frame(width: geo.size.width / 5, height: geo.size.width / 5)
                            }
                            
                            .background(Image("woodbox")
                                .resizable()
                                .frame(width: geo.size.width / 5, height: geo.size.width / 5))
                            
                            
                            Button {
                                if !gameOver {
                                    if !matchTrash(answer: trashObject, choose: "paper") {
                                        leftLife -= 1
                                        countStacks = 0
                                    }else{
                                        countStacks += 1
                                        if maxStack <= countStacks {
                                            maxStack = countStacks
                                        }
                                    }
                                    trashObject = Trash()
                                    leftTime = 0
                                }
                            } label: {
                                Text("paper")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.system(size: 50))
                                    .frame(width: geo.size.width / 5, height: geo.size.width / 5)
                            }
                            
                            .background(Image("woodbox")
                                .resizable()
                                .frame(width: geo.size.width / 5, height: geo.size.width / 5))
                            
                            
                            
                            
                            Button {
                                if !gameOver{
                                    if !matchTrash(answer: trashObject, choose: "glass") {
                                        leftLife -= 1
                                        countStacks = 0
                                    }else{
                                        countStacks += 1
                                        if maxStack <= countStacks {
                                            maxStack = countStacks
                                        }
                                    }
                                    trashObject = Trash()
                                    leftTime = 0
                                }
                            } label: {
                                Text("glass")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.system(size: 50))
                                    .frame(width: geo.size.width / 5, height: geo.size.width / 5)
                            }
                            
                            .background(Image("woodbox")
                                .resizable()
                                .frame(width: geo.size.width / 5, height: geo.size.width / 5))
                            
                            Button {
                                if !gameOver {
                                    if !matchTrash(answer: trashObject, choose: "plastic") {
                                        leftLife -= 1
                                        countStacks = 0
                                    }else{
                                        countStacks += 1
                                        if maxStack <= countStacks {
                                            maxStack = countStacks
                                        }
                                    }
                                    trashObject = Trash()
                                    leftTime = 0
                                }
                            } label: {
                                Text("plastic")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.system(size: 50))
                                    .frame(width: geo.size.width / 5, height: geo.size.width / 5)
                            }
                            
                            .background(Image("woodbox")
                                .resizable()
                                .frame(width: geo.size.width / 5, height: geo.size.width / 5))
                            
                            Button {
                                if !gameOver{
                                    if !matchTrash(answer: trashObject, choose: "general") {
                                        leftLife -= 1
                                        countStacks = 0
                                    }else{
                                        countStacks += 1
                                        if maxStack <= countStacks {
                                            maxStack = countStacks
                                        }
                                    }
                                    trashObject = Trash()
                                    
                                    leftTime = 0
                                }
                            } label: {
                                Text("general")
                                    .bold()
                                    .foregroundColor(.black)
                                    .font(.system(size: 50))
                                    .frame(width: geo.size.width / 5, height: geo.size.width / 5)
                            }
                            
                            .background(Image("woodbox")
                                .resizable()
                                .frame(width: geo.size.width / 5, height: geo.size.width / 5))
                            
                            
                            
                        }
                    }
                    .onReceive(timer) { _ in
                        if leftTime < 10 {
                            leftTime += 1
                        }
                        if leftTime >= 10 {
                            leftLife -= 1
                            leftTime = 0
                            trashObject = Trash()
                        }
                        if leftLife <= 0 {
                            self.timer.upstream.connect().cancel()
                            gameOver = true
                            gameOver2 = true
                        }
                    }
                }
            }
        }
    }
}
var countStacks: Int = 0
var maxStack: Int = 0


func makeTrash(trash: Trash) -> some View {
    
    let trash: String = trash.getType()
    
    return Image(trash)
        .resizable()
        .frame(width: 500, height: 500)
        .background(.white)
        .cornerRadius(40)
}

// MARK: trash match check

func matchTrash(answer: Trash, choose: String) -> Bool {
    if answer.getType() == choose {
        return true
    } else {
        return false
    }
}


struct Trash {
    let type: TrashType
    
    init() {
        // MARK: basic type define using randomNumber
        let randomNumber: Int = Int.random(in: 0...4)
        switch (randomNumber) {
            case 0:
                self.type = .Can
                break
                
            case 1:
                self.type = .Glass
                break
                
            case 2:
                self.type = .Paper
                break
                
            case 3:
                self.type = .Plastic
                break
                
            case 4:
                self.type = .General
                break
                
            default:
                self.type = .Paper
                break
        }
    }
    
    // MARK: type define
    func getType() -> String {
        switch type {
            case .Plastic:
                return "plastic"
            case .Can:
                return "can"
            case .Paper:
                return "paper"
            case .Glass:
                return "glass"
            case .General:
                return "general"
        }
    }
}


// MARK: trashType define
enum TrashType: CaseIterable {
    case Can, Paper, Plastic, Glass, General
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
