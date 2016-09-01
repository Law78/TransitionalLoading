
import Foundation
import SpriteKit

class Button: SKSpriteNode {
    
    private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(spriteName: String, position: CGPoint){
        //let texture = GameTextures.instance.textureWithName(name: spriteName)
        
        let texture = GameTextures.instance.interfaceAssets[spriteName]
        print(texture)
        

        self.init(texture: texture, color: SKColor.whiteColor(), size: texture!.size())
        
        self.setupButton(position: position)
    }
    
    private func setupButton(position position: CGPoint){
        self.position = position
    }
    
    
}