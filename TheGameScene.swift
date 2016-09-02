//
//  TheGameScene.swift
//  TransitionLoading
//
//  Created by Lorenzo on 01/09/16.
//  Copyright © 2016 Lorenzo Franceschini. All rights reserved.
//

import SpriteKit

class TheGameScene: SKScene {
    
    private var sceneLabel: SKLabelNode?
    private var backgroundParticles: BackgroundParticles?
    private var backgroundLayer: Background?
    private var interfaceNode: SKNode = SKNode()
    
    private var lastUpdateTime: NSTimeInterval = 0.0
    private var frameCount: NSTimeInterval = 0.0

    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.sceneLabel = SKLabelNode(fontNamed: kDefaultFont)
        self.sceneLabel?.fontColor = SKColor.whiteColor()
        self.sceneLabel?.fontSize = kDefaultFontSize
        self.sceneLabel?.text = "Game Scene"
        self.sceneLabel?.position = kScreenCenter
        
        self.backgroundParticles =  BackgroundParticles(backgroundType: BackgroundParticles.BackgroundType.Game)
        self.backgroundLayer = Background(copies: 2, nodeName: "Background-Fixed", spriteName: InterfaceNameConstants.BACKGROUND)
        
        self.interfaceNode.addChild(self.backgroundParticles!)
        self.interfaceNode.addChild(self.backgroundLayer!)
        self.interfaceNode.addChild(self.sceneLabel!)
        
        self.addChild(interfaceNode)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToView(view: SKView) {
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        let delta = currentTime - self.lastUpdateTime
        self.lastUpdateTime = currentTime
        self.frameCount += delta

        if self.frameCount >= 1.0 {
            
            //self.backgroundLayer!.scrollBackground(backgroundSpeed: 50.0)
            // Reset the frameCounter to 0
            print("FRAME 1/s")
            self.frameCount = 0.0
        }
        
        //self.backgroundLayer!.scrollBackground(backgroundSpeed: 10.0)
        
        //print(DoubleToDecimal(decimalNumber: self.frameCount, numberOfPlaces: 1))
        
        if (DoubleToDecimal(decimalNumber: self.frameCount, numberOfPlaces: 1)) % 2 == 0 {
            self.backgroundLayer!.scrollBackground(backgroundSpeed: 10.0, delta: delta)
            //print("FRAME PARI/s")

        }
        /*if round(self.frameCount, 2) >= 0.3 && self.frameCount <= 0.32 {
            
            self.backgroundLayer!.scrollBackground(backgroundSpeed: 50.0)
            // Reset the frameCounter to 0
            print("FRAME 0.3/s")
           
        }
 */
        
        
        /*if self.frameCount%0.5 >= 1 {
            
            self.backgroundLayer!.scrollBackground(backgroundSpeed: 50.0)
            
            print("FRAME 0.5/s")
        }*/

        
        
    }
}