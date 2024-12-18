import SpriteKit

class LibraryScene: SKScene {
    
    // MARK: - Properties
    private var background: SKSpriteNode!
    private var books: [SKSpriteNode] = []
    private let bookNames = ["Frozen Glade", "Desert Ruins", "Starlit Dreamscape"]
    private var bookPositions: [CGPoint] = []
    
    // MARK: - Scene Lifecycle
    override func didMove(to view: SKView) {
        setupSceneSize()
        setupBackground()
        calculateBookPositions()
        setupBooks()
    }
    
    // MARK: - Setup Methods
    private func setupSceneSize() {
        // Ensure the scene matches the screen size
        self.size = UIScreen.main.bounds.size
        self.scaleMode = .resizeFill
    }
    
    private func setupBackground() {
        // Add the library background image
        background = SKSpriteNode(imageNamed: "library_background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = self.size // Scale to fit the screen
        background.zPosition = -1 // Send it to the back
        addChild(background)
    }
    
    private func calculateBookPositions() {
        // Dynamically calculate book positions based on screen size
        let screenWidth = size.width
        let screenHeight = size.height
        
        bookPositions = [
            CGPoint(x: screenWidth * 0.3, y: screenHeight * 0.6),
            CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.4),
            CGPoint(x: screenWidth * 0.7, y: screenHeight * 0.6)
        ]
    }
    
    private func setupBooks() {
        for (index, position) in bookPositions.enumerated() {
            // Create the glowing book sprite
            let book = SKSpriteNode(imageNamed: "glowing_book")
            book.position = position
            book.name = "book_\(index)"
            book.setScale(0.3) // Scale the books down further
            book.zPosition = 0
            addChild(book)
            books.append(book)
            
            // Add a label below each book
            let label = SKLabelNode(text: bookNames[index])
            label.position = CGPoint(x: position.x, y: position.y - 100)
            label.fontSize = 20
            label.fontColor = .white
            label.fontName = "AvenirNext-Bold"
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
        // Directly load the Swift scene
        if sceneName == "FrozenGladeScene" {
            let nextScene = FrozenGladeScene(size: self.size)
            nextScene.scaleMode = .resizeFill
            self.view?.presentScene(nextScene, transition: .fade(withDuration: 1.5))
        } else if let nextScene = SKScene(fileNamed: sceneName) {
            nextScene.scaleMode = .aspectFill
            self.view?.presentScene(nextScene, transition: .fade(withDuration: 1.5))
        } else {
            print("Error: Could not load \(sceneName).")
        }
    }    
}

