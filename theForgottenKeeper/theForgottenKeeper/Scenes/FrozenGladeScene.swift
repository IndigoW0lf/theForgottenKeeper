import SpriteKit

class FrozenGladeScene: SKScene {
    
    // MARK: - Properties
    private var background: SKSpriteNode!
    
    // MARK: - Scene Lifecycle
    override func didMove(to view: SKView) {
        setupBackground()
        addPlaceholderMessage()
    }
    
    // MARK: - Setup Methods
    private func setupBackground() {
        background = SKSpriteNode(imageNamed: "frozen_glade_background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.size = self.size
        background.zPosition = -1
        addChild(background)
    }
    
    private func addPlaceholderMessage() {
        let label = SKLabelNode(text: "Welcome to the Frozen Glade!")
        label.position = CGPoint(x: size.width / 2, y: size.height / 2)
        label.fontSize = 30
        label.fontColor = .white
        label.fontName = "AvenirNext-Bold"
        label.zPosition = 1
        addChild(label)
    }
    
    // MARK: - Interaction Logic
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        // Placeholder for interactions
        print("You touched the Frozen Glade!")
    }
}
