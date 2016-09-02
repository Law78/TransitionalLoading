//
//  Bullet.swift
//  Spaceship
//
//  Created by Lorenzo on 31/08/16.
//  Copyright © 2016 Lorenzo Franceschini. All rights reserved.
//

import Foundation
import SpriteKit

class Bullet: SKSpriteNode, GameSprite {
    
    var textureName: String = "Bullet"
    
    func spawn(parentNode: SKNode, position: CGPoint) {
        parentNode.addChild(self)
        self.position = position
    }
    
    
    
    
    
    //var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "GameSprites")
    
}
