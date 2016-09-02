//
//  TheGameScene.swift
//  TransitionLoading
//
//  Created by Lorenzo on 01/09/16.
//  Copyright © 2016 Lorenzo Franceschini. All rights reserved.
//

import SpriteKit

class TheGameScene: SKScene, SKPhysicsContactDelegate {
    
    private var player: Player?
    
    private var sceneLabel: SKLabelNode?
    private var backgroundParticles: BackgroundParticles?
    private var backgroundLayer: Background?
    private var interfaceNode: SKNode = SKNode()
    private var gameNode: SKNode = SKNode()
    
    private var lastUpdateTime: NSTimeInterval = 0.0
    private var frameCount: NSTimeInterval = 0.0

    
    override init(size: CGSize) {
        super.init(size: size)
        GameTextures.instance.loadLevel1Assets()
        self.sceneLabel = SKLabelNode(fontNamed: kDefaultFont)
        self.sceneLabel?.fontColor = SKColor.whiteColor()
        self.sceneLabel?.fontSize = kDefaultFontSize
        self.sceneLabel?.text = "Game Scene"
        self.sceneLabel?.position = kScreenCenter
        
        self.backgroundParticles =  BackgroundParticles(backgroundType: BackgroundParticles.BackgroundType.Game)
        self.backgroundLayer = Background(copies: 2, nodeName: "Background-Fixed", spriteName: InterfaceNameConstants.BACKGROUND)
        
        self.player = Player()
        
        self.interfaceNode.addChild(self.backgroundParticles!)
        self.interfaceNode.addChild(self.backgroundLayer!)
        self.interfaceNode.addChild(self.sceneLabel!)
        
        self.addChild(interfaceNode)
        self.addChild(gameNode)
        
        self.setupPhysics()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToView(view: SKView) {
        self.player!.spawn(self.gameNode, position: CGPoint(x: kViewSize.width / 2, y: kViewSize.height * 0.1))
        self.player!.autofire(duration: 0.3)
    }
    
    
    private func setupPhysics(){
        // Setting physics to the scene with a gravity equal to 0 and self as contact delegate
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        self.physicsWorld.contactDelegate = self
        let screenBounds = CGRectMake(-self.player!.size.width / 2, 0, kViewSize.width + self.player!.size.width, kViewSize.height)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: screenBounds)
        self.physicsBody?.categoryBitMask = BodyType.Scene.rawValue
        
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        self.player!.updateTargetLocation(newLocation: touchLocation)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        print("Touch End", touchLocation)
        self.player!.updateTargetLocation(newLocation: touchLocation)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        print("Touch Moved", touchLocation)
        self.player!.updateTargetLocation(newLocation: touchLocation)
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        let delta = currentTime - self.lastUpdateTime
        self.lastUpdateTime = currentTime
        self.frameCount += delta
        
        self.player!.update()

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