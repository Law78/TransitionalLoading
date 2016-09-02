import SpriteKit

protocol GameSprite {
    //var textureAtlas: SKTextureAtlas{ get set }
    
    func spawn(parentNode: SKNode, position: CGPoint)
    var textureName: String { get set }
    
}
