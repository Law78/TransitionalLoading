import SpriteKit
import Foundation

class SpaceShipBullet: Bullet {
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize){
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(){
        let texture = GameTextures.instance.spriteAssets[SpriteNameConstants.SPACE_SHIP_BULLET]//GameTextures.sharedInstance.textureWithName(name: SpriteName.SpaceShipBullet)
        
        self.init(texture: texture, color: SKColor.whiteColor(), size: CGSize(width: texture!.size().width, height: texture!.size().height ))
        //self.setupBullet(x: x, y: y)
        self.setupBulletPhysics()
    }
    
    private func setupBullet(){
        self.name = self.textureName
        //self.position = CGPoint(x: x, y: y)
        if(kDebug){
            //print("BULLET POSITION \(self.position) BULLET SIZE \(self.size)")
        }
    }
    
    private func setupBulletPhysics(){
        
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.allowsRotation = false
        
        self.physicsBody?.categoryBitMask = BodyType.SpaceShipBullet.rawValue
        self.physicsBody?.collisionBitMask = 0x0
        self.physicsBody?.contactTestBitMask = BodyType.Enemy.rawValue | BodyType.Meteor.rawValue
    }
    
    
    
    
}
