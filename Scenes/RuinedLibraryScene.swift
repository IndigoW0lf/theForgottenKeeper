import SpriteKit

class RuinedLibraryScene: SKScene {
    
    // MARK: - Properties
    private var background: SKSpriteNode!
    private var brokenBook: SKSpriteNode!
    private var storyLabel: SKLabelNode!
    private var promptLabel: SKLabelNode!
    
    // MARK: - Scene Lifecycle
    override func didMove(to view: SKView) {
        setupBackground()
        setupBrokenBook()
        setupStoryText()
    }
    
    // MARK: - Setup Methods
    private func setupBackground() {
        background = SKSpriteNode(imageNamed: "ruined_library_background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = self.size
        background.zPosition = -1
        addChild(background)
    }
    
    private func setupBrokenBook() {
        // A glowing but broken book for interaction
        brokenBook = SKSpriteNode(imageNamed: "broken_book")
        brokenBook.position = CGPoint(x: size.width / 2, y: size.height * 0.4)
        brokenBook.name = "broken_book"
        brokenBook.setScale(0.5)
        brokenBook.zPosition = 0
        addChild(brokenBook)
    }
    
    private func setupStoryText() {
        // Story introduction label
        storyLabel = SKLabelNode(text: "The Library is in ruins...")
        storyLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.8)
        storyLabel.fontSize = 24
        storyLabel.fontColor = .white
        storyLabel.fontName = "AvenirNext-Bold"
        storyLabel.zPosition = 1
        addChild(storyLabel)
        
        // Prompt to interact with the first book
        promptLabel = SKLabelNode(text: "Tap the glowing book to begin restoring...")
        promptLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.2)
        promptLabel.fontSize = 20
        promptLabel.fontColor = .lightGray
        promptLabel.fontName = "AvenirNext-Regular"
        promptLabel.zPosition = 1
        addChild(promptLabel)
    }
    
    // MARK: - Interaction Logic
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "broken_book" {
            handleBookInteraction()
        }
    }
    
    private func handleBookInteraction() {
        // Transition to the Frozen Glade Scene
        print("Restoring the first book...")
        transitionToScene(named: "FrozenGladeScene")
    }
    
    // MARK: - Scene Transition
    private func transitionToScene(named sceneName: String) {
        if let nextScene = FrozenGladeScene(size: self.size) {
            nextScene.scaleMode = .resizeFill
            self.view?.presentScene(nextScene, transition: .fade(withDuration: 1.5))
        } else {
            print("Error: Could not load \(sceneName).")
        }
    }
}
