
import SpriteKit
import Foundation

class Background: SKNode {
    
    /*private override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(spriteName: String, copies: Int, nodeName: String){
        //let texture = GameTextures.instance.textureWithName(name: spriteName)
        
        let texture = GameTextures.instance.interfaceAssets[spriteName]
        
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture!.size())
        
        self.addBackground(copies: copies, nodeName: nodeName) //, spriteName: <#T##String#>)(position: position)
    }
*/
    
    //func scrollBackground(layer layer: SKNode, backgroundSpeed: Double, delta: NSTimeInterval){
    func scrollBackground(backgroundSpeed backgroundSpeed: Double, delta: NSTimeInterval){
        
        var yStep = -backgroundSpeed * 0.075
        
        if delta >= 0 && delta < 1 {
            yStep = -backgroundSpeed * delta
        }
        
        //let yStep = kDeviceTablet ? CGFloat(delta) * 60 * 0.5 : CGFloat(delta) * 60 * 0.25
        
        
       for case let child as SKSpriteNode in self.children {
        //child.position = CGPoint(x: 0, y: child.position.y + CGFloat(yStep) - 1)
            child.position = CGPoint(x: 0, y: child.position.y + CGFloat(yStep))
        
            if floor(child.position.y) <= floor(-child.frame.size.height){
                child.position = CGPoint(x: 0, y: child.frame.size.height + CGFloat(yStep))
                if kDebug {
                    print("Posizionato Background", child.position.y)
                }
            }
            
        }
        
    }
    
    convenience init(copies: Int, nodeName: String, spriteName: String){
        self.init()
        self.position = CGPoint(x: 0, y: 0)
        for index in 0..<copies{
            let background = GameTextures.instance.spriteWithName(name: spriteName)
            background.aspectFillToSize(kViewSize)
            if kDebug {
                print("dimensioni immagine: ", background.size)
            }
            background.name = nodeName
            background.anchorPoint = CGPointZero
            background.position = CGPoint(x: 0, y: CGFloat(index) * background.size.height)
            background.zPosition = -1
            if kDebug {
                print("Init Position Background \(background.position.x) \(background.position.y)")
            }

            self.addChild(background)
            
        }
        
    }
    
}