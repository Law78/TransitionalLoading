

import SpriteKit

class BackgroundParticles: SKNode {
    
    private let backgroundRunSpeed: CGFloat = -400.0
    private let backgroundSlowSpeed: CGFloat = -25.0
    private let backgroundStopSpeed: CGFloat = -1.0
    
    private var backgroundStarsParticles = SKEmitterNode()
    //private var backgroundCometParticles = SKEmitterNode()
    private var backgroundStarsField1Particles = SKEmitterNode()
    private var backgroundStarsField2Particles = SKEmitterNode()
    private var backgroundStarsField3Particles = SKEmitterNode()
    
    private var backgrounds: NSArray = [SKEmitterNode()]
    
    internal enum BackgroundType: Int {
        case Main
        case Game
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(){
        super.init()
        
        
    }
    
    // http://stackoverflow.com/questions/26939107/how-class-that-inherits-skspritenode-with-init-that-can-call-initcolor-size
    convenience init(backgroundType: BackgroundType){
        self.init()
        self.setupBackground(backgroundType: backgroundType)
    }
    
    private func setupBackground(backgroundType backgroundType: BackgroundType){
        
        switch backgroundType{
        case BackgroundType.Main:
            self.backgroundStarsParticles = GameParticles.sharedInstance.createParticle(particles: GameParticles.Particles.Stars)
            self.addChild(self.backgroundStarsParticles)
            self.slowBackground()
            self.backgroundStarsParticles.advanceSimulationTime(20)
        case BackgroundType.Game:
            self.backgroundStarsParticles = GameParticles.sharedInstance.createParticle(particles: GameParticles.Particles.Stars)
            self.backgroundStarsField1Particles = GameParticles.sharedInstance.createParticle(particles: GameParticles.Particles.StarsField1)
            self.backgroundStarsField2Particles = GameParticles.sharedInstance.createParticle(particles: GameParticles.Particles.StarsField2)
            self.backgroundStarsField3Particles = GameParticles.sharedInstance.createParticle(particles: GameParticles.Particles.StarsField3)
            
            //self.backgrounds = [self.backgroundStarsParticles]
            
            self.addChild(self.backgroundStarsParticles)
            
            
            /*self.stopBackground(emitter: self.backgroundStarsParticles)
             self.stopBackground(emitter: self.backgroundStarsField1Particles)
             self.stopBackground(emitter: self.backgroundStarsField2Particles)
             self.stopBackground(emitter: self.backgroundStarsField3Particles)
             self.backgroundStarsParticles.advanceSimulationTime(20)
             self.backgroundStarsField1Particles.advanceSimulationTime(20)
             self.backgroundStarsField2Particles.advanceSimulationTime(20)
             self.backgroundStarsField3Particles.advanceSimulationTime(20)*/
            self.addChild(self.backgroundStarsField1Particles)
            self.addChild(self.backgroundStarsField2Particles)
            self.addChild(self.backgroundStarsField3Particles)
            
        }
        
        
    }
    
    func startBackground() {
        for node in self.children {
            if let emitter = node as? SKEmitterNode {
                emitter.particleBirthRate = emitter.particleBirthRate * 1.5
                emitter.particleSpeed = self.backgroundRunSpeed
                emitter.particleSpeedRange = self.backgroundRunSpeed / 4
            }
        }
    }
    
    func slowBackground() {
        for node in self.children {
            if let emitter = node as? SKEmitterNode {
                emitter.particleSpeed = self.backgroundStopSpeed
                emitter.particleSpeedRange = self.backgroundStopSpeed / 4
            }
        }
        
    }
    
    func removeAllBackground() {
        for node in self.children {
            node.removeFromParent()
        }
    }
    
    func regenerateBackground(backgroundType backgroundType: BackgroundType){
        self.setupBackground(backgroundType: backgroundType)
        self.slowBackground()
    }
    
}
