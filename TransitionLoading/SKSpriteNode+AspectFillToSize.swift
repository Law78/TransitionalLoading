// http://stackoverflow.com/questions/28976298/sktexture-from-uiimage-that-respects-aspect-ratio

import SpriteKit

extension SKSpriteNode {
    
    func aspectFillToSize(fillSize: CGSize) {
        
        if texture != nil {
            self.size = texture!.size()
            
            let verticalRatio = fillSize.height / self.texture!.size().height
            let horizontalRatio = fillSize.width /  self.texture!.size().width
            
            let scaleRatio = horizontalRatio > verticalRatio ? horizontalRatio : verticalRatio
            
            self.setScale(scaleRatio)
        }
    }
    
    func getRatioHeight(fillSize: CGSize) -> CGFloat{
        
        self.size = texture!.size()
        
        let verticalRatio = fillSize.height / self.texture!.size().height
        
        return verticalRatio
        
        
    }
    
}


