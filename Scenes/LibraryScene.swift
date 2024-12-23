import SpriteKit

class LibraryScene: SKScene {
    
    // MARK: - Properties
    private var background: SKSpriteNode!
    private var books: [SKSpriteNode] = []
    private let bookNames = ["Frozen Glade", "Desert Ruins", "Starlit Dreamscape"]
    private let bookPositions = [
        CGPoint(x: 200, y: 400),
        CGPoint(x: 500, y: 500),
        CGPoint(x: 800, y: 400)
    ]
    
    // MARK: - Scene Lifecycle
    override func didMove(to view: SKView) {
        setupBackground()
        setupBooks()
    }
    
    // MARK: - Setup Methods
    private func setupBackground() {
        background = SKSpriteNode(imageNamed: "library_background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = self.size
        background.zPosition = -1
        addChild(background)
    }
    
    private func setupBooks() {
        for (index, position) in bookPositions.enumerated() {
            let book = SKSpriteNode(imageNamed: "glowing_book")
            book.position = position
            book.name = "book_\(index)" // Unique name for each book
            addChild(book)
            books.append(book)
            
            // Add a label for the book
            let label = SKLabelNode(text: bookNames[index])
            label.position = CGPoint(x: position.x, y: position.y - 50)
            label.fontSize = 20
            label.fontColor = .white
            label.zPosition = 1
            addChild(label)
        }
    }
    
    // MARK: - Interaction Logic
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let node = self.atPoint(location)
        
        if let nodeName = node.name, nodeName.starts(with: "book_") {
            let bookIndex = Int(nodeName.split(separator: "_")[1]) ?? -1
            handleBookInteraction(bookIndex: bookIndex)
        }
    }
    
    private func handleBookInteraction(bookIndex: Int) {
        switch bookIndex {
        case 0:
            print("Transitioning to Frozen Glade...")
            transitionToScene(named: "FrozenGladeScene")
        case 1:
            print("Desert Ruins is under construction!")
        case 2:
            print("Starlit Dreamscape is under construction!")
        default:
            print("Unknown book interaction.")
        }
    }
    
    // MARK: - Scene Transition
    private func transitionToScene(named sceneName: String) {
        if let nextScene = SKScene(fileNamed: sceneName) {
            nextScene.scaleMode = .aspectFill
            self.view?.presentScene(nextScene, transition: .fade(withDuration: 1.5))
        } else {
            print("Error: Could not load \(sceneName).")
        }
    }
}