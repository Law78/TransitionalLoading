
import SpriteKit

// MARK: - This class show a cicle when User touch the screen
class TouchCircle: SKSpriteNode{
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(){
        let texture = GameTextures.instance.interfaceAssets[InterfaceNameConstants.TOUCH_CIRCLE]//GameTextures.sharedInstance.textureWithName(name: SpriteName.TouchCircle)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture!.size())
        
        self.setupTouchCirlce()
    }
    
    // MARK: - Setup Circle, at beginning is invisible
    private func setupTouchCirlce(){
        self.alpha = 0.0
    }
    
    func animateTouchCirle(atPosition atPosition: CGPoint){
        self.position = atPosition
        
        let fadeIn = SKAction.fadeAlphaTo(0.5, duration: 0.15)
        let scaleIn = SKAction.scaleTo(1.1, duration: 0.15)
        // fadeIn and scaleIn are in the same group, so run at the same time
        let scaleInGroup = SKAction.group([fadeIn, scaleIn])
        // then the touch came back to the original size
        let scaleInNormal = SKAction.scaleTo(1.0, duration: 0.15)
        // we create a sequence
        let scaleInSequence = SKAction.sequence([scaleInGroup, scaleInNormal])
        // we run the sequence then remove it from the game
        self.runAction(SKAction.sequence([scaleInSequence, SKAction.fadeOutWithDuration(0.15), SKAction.removeFromParent()]))
    }
    
    
}