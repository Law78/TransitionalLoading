//
//  MainMenu.swift
//  TransitionLoading
//
//  Created by Lorenzo on 01/09/16.
//  Copyright © 2016 Lorenzo Franceschini. All rights reserved.
//

import SpriteKit

class MainScene: SKScene {
    
    private var sceneLabel: SKLabelNode = SKLabelNode()
    private var playButton: Button?
    
    override init(size: CGSize) {
        super.init(size: size)
        GameTextures.instance.getAssetsDictionaryFromAtlasNamed(AtlasNameConstants.SPRITE_ATLAS)
        GameTextures.instance.getAssetsDictionaryFromAtlasNamed(AtlasNameConstants.INTERFACE_ATLAS)
        GameTextures.instance.loadLevel1Assets()
        self.playButton = Button(spriteName: InterfaceNameConstants.PLAYBUTTON, position: CGPoint(x: UIScreen.mainScreen().bounds.size.width / 2, y: UIScreen.mainScreen().bounds.size.height * 0.7))
        self.sceneLabel.fontName = "Edit Undo BRK"
        self.sceneLabel.fontColor = SKColor.whiteColor()
        self.sceneLabel.fontSize = UIScreen.mainScreen().bounds.size.width * 0.1
        self.sceneLabel.text = "Menu Scene"
        self.sceneLabel.position = CGPoint(x: UIScreen.mainScreen().bounds.size.width / 2, y: UIScreen.mainScreen().bounds.size.height / 2)
        
        self.addChild(self.sceneLabel)
        self.addChild(self.playButton!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
    }
    
    override func didMoveToView(view: SKView) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        
        if self.playButton!.containsPoint(touchLocation){
           
            print("MenuScene: Loading The Game Scene")
            
            
            self.loadGameScene()
        }
    }
    
    private func loadGameScene(){
        let gameScene = TheGameScene(size: UIScreen.mainScreen().bounds.size)
        self.view?.presentScene(gameScene)
    }
    
    
    
}
