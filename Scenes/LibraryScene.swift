import SpriteKit

class LibraryScene: SKScene {
    
    // MARK: - Properties
    private var background: SKSpriteNode!
    private var glowingBook: SKSpriteNode!
    
    // MARK: - Scene Lifecycle
    override func didMove(to view: SKView) {
        setupBackground()
        setupGlowingBook()
    }
    
    // MARK: - Setup Methods
    private func setupBackground() {
        background = SKSpriteNode(imageNamed: "library_background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = self.size
        background.zPosition = -1
        addChild(background)
    }
    
    private func setupGlowingBook() {
        glowingBook = SKSpriteNode(imageNamed: "glowing_book")
        glowingBook.position = CGPoint(x: size.width / 2, y: size.height / 2)
        glowingBook.name = "glowingBook" // Identifier for touch interaction
        addChild(glowingBook)
    }
    
    // MARK: - Interaction Logic
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let node = self.atPoint(location)
        
        // Check if the glowing book was touched
        if node.name == "glowingBook" {
            handleBookInteraction()
        }
    }
    
    private func handleBookInteraction() {
        print("Glowing book tapped! Transitioning to Frozen Glade...")
        transitionToFrozenGlade()
    }
    
    // MARK: - Scene Transition
    private func transitionToFrozenGlade() {
        if let frozenGladeScene = FrozenGladeScene(fileNamed: "FrozenGladeScene") {
            frozenGladeScene.scaleMode = .aspectFill
            self.view?.presentScene(frozenGladeScene, transition: .fade(withDuration: 1.0))
        } else {
            print("Error: Could not load FrozenGladeScene.")
        }
    }
}