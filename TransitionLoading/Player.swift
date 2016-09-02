
import SpriteKit
import Foundation

class Player: SKSpriteNode, GameSprite {
    
    var textureName: String = "Player"
    
    //var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "GameSprites")
    
    private var targetPosition: CGPoint?
    private var lastPosition: CGPoint?
    
    private let filter: CGFloat = 0.05
    
    var level: Int = 1
    var immune: Bool = false
    var energy: Int = 100
    
    
    var bullet: Bullet?
    
    private var canMove = true
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize){
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(){
        let texture = GameTextures.instance.spriteAssets[SpriteNameConstants.PLAYER]//GameTextures.sharedInstance.textureWithName(name: SpriteName.Player)
        
        self.init(texture: texture, color: SKColor.whiteColor(), size: CGSize(width: texture!.size().width * 0.2, height: texture!.size().height * 0.2))
        self.setupPlayer()
        self.setupPlayerPhysics()
    }
    
    func spawn(parentNode: SKNode, position: CGPoint) {
        parentNode.addChild(self)
        self.position = position
    }
    
    private func setupPlayer(){
        //self.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.1)
        self.targetPosition = self.position
        self.lastPosition = self.position
        
        
        
        if (kDebug) {
            print("POSITION PLAYER:", self.position)
        }
    }
    
    func getPlayerLevel() -> Int {
        return self.level
    }
    
    // MARK: - Call for every frame
    func update(){
        if (self.canMove==true) {
            // Use floor instead of round
            if floor(self.lastPosition!.x) != floor(self.targetPosition!.x) {
                if kDebug {
                    //print("moving to... ",self.lastPosition!.x,self.targetPosition!.x)
                }
                self.move()
            } else {
                if kDebug {
                    //print("stopped")
                }
            }
        }
        
        
    }
    
    // MARK: - Called for every touch on the screen
    func updateTargetLocation(newLocation newLocation: CGPoint){
        if kDebug {
            print("Someone touched my screen")
        }
        self.targetPosition = CGPoint(x: newLocation.x, y: self.targetPosition!.y)
        self.runAction(SKAction.sequence(
            [
                SKAction.scaleXTo(1.2, duration: 0.5),
                SKAction.scaleXTo(1.0, duration: 0.3)
            ])
        )
        let touchCircle = TouchCircle()
        // we add the touchCircle to the GameScene
        self.parent?.addChild(touchCircle)
        touchCircle.animateTouchCirle(atPosition: CGPoint(x: self.targetPosition!.x, y: self.position.y))
    }
    
    func enableMovement(canDo canDo: Bool){
        self.canMove = canDo
    }
    
    // MARK: - Called by update only if lastPosition!=targetPosition. It's use Smooth function from Math Custom Library
    private func move(){
        let newX = Smooth(startPoint: self.position.x , endPoint: self.targetPosition!.x, filter: self.filter)
        //let newX = Pythagorus(startPoint: self.position, endPoint: self.targetPosition!, filter: self.filter)
        self.position = CGPoint(x: newX , y: self.position.y)
        self.lastPosition = self.position
    }
    
    private func setupPlayerPhysics(){
        // we set a circle for player physics body
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width / 2, center: self.anchorPoint)
        // the collision doesn't rotate the sprite
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = BodyType.Player.rawValue
        self.physicsBody?.collisionBitMask = BodyType.Scene.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.Scene.rawValue | BodyType.Meteor.rawValue
    }
    
    private func blinkPlayer() {
        let blink = SKAction.sequence([SKAction.fadeOutWithDuration(0.15), SKAction.fadeInWithDuration(0.15)])
        self.runAction(SKAction.repeatActionForever(blink), withKey: "Blink")
    }
    
    // MARK: - Contact
    func hitMeteor() {
        
        // Does the player have any lives left?
        //if GameplayController.instance.lives > 0 {
            // Make the player immune
            self.immune = true
            
            // Blink the player to show immunity
            self.blinkPlayer()
            
            // In 3 seconds, remove the immunity and the blink action
            self.runAction(SKAction.waitForDuration(3.0), completion: {
                self.immune = false
                self.removeActionForKey("Blink")
            })
        //}
    }
    
    
    func addBullet(){
        
        self.bullet = SpaceShipBullet() //x: self.position.x, y: self.position.y * 1.15)
        self.bullet!.spawn(self.parent!, position: CGPoint(x: self.position.x, y: self.position.y * 1.15))
        let target = CGPoint(x: self.position.x, y: kViewSize.height * 1.25)
        
        let move = SKAction.moveTo(target, duration: 1)
        
        let remove = SKAction.removeFromParent()
        
        let sequence = SKAction.sequence([move, remove])
        
        self.bullet!.runAction(sequence)
    }
    
    
    func autofire(duration duration: NSTimeInterval = 1.0 ){
        
        let action = SKAction.runBlock({
            self.addBullet()
        })
        
        /*let spawn = SKAction.runBlock(){
         self.addBullet(y: y)
         }*/
        let delay =  SKAction.waitForDuration(duration)
        let sequence = SKAction.sequence([action, delay])
        
        //self.runAction(sequence)
        let forever = SKAction.repeatActionForever(sequence)
        runAction(forever, withKey: "autofire")
        
        //runAction(SKAction.repeatActionForever(sequence))
        
        
        
    }
    
    
    
    
}
