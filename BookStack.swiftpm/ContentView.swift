import SwiftUI

struct ContentView: View {
    @State var bookCount: Int = 0
    @State var isDrop: Bool = false
    
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
                
                
                VStack(alignment: .center) {
                    let randomBook = createBook()
                    Rectangle()
                        .frame(width: randomBook.width, height: randomBook.height)
                        .position(x: 100, y: 80)
                        .offset(x: isDrop ? -100 : 300, y: 100)
                        .animation(.easeIn, value: isDrop)
                    
                    Button {
                        isDrop.toggle()
                    } label: {
                        Text("Drop!")
                    }
                }
            }
        }
    }
}

func createBook() -> Book {
    
    var randomNumber: Int = Int.random(in: 0...3)
    let randomBook: Book
    switch (randomNumber) {
        case 0:
            randomBook = Book(type: .Large)
            break
            
        case 1:
            randomBook = Book(type: .Big)
            break
        
        case 2:
            randomBook = Book(type: .Middle)
            break
        
        case 3:
            randomBook = Book(type: .Small)
            break
        default:
            randomBook = Book(type: .Small)
            break
    }
    
    return randomBook
}

func moveBook(randomBook: Book) {
    
}

func dropBook(randomBook: Book) {
    
    
}

func stackBook() {
    
}

func checkingGravity() {
    
}

func collapsBook() {
    
}

struct Book {
    let type: BookType
    var mainPoint: Double
    let width: CGFloat
    let height: CGFloat
    
    init(type: BookType) {
        self.type = type
        switch type {
            case .Large:
                width = 120
                mainPoint = 60
                height = 40
            case .Big:
                width = 100
                mainPoint = 50
                height = 25
            case .Middle:
                width = 75
                mainPoint = 37.5
                height = 20
            case .Small:
                width = 50
                mainPoint = 25
                height = 15
        }
    }
}


// MARK: books top pos is y: 110
enum BookType {
    case Large, Big, Middle, Small
}


struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
