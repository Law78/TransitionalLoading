
import SpriteKit

let GameParticlesSharedInstance = GameParticles()

// Singleton Class
class GameParticles {
    
    class var sharedInstance:GameParticles {
        return GameParticlesSharedInstance
    }
    
    internal enum Particles: Int {
        case Magic
        case Stars
        case Comet
        case StarsField1
        case StarsField2
        case StarsField3
    }
    
    private var magicParticles = SKEmitterNode()
    private var starsParticles = SKEmitterNode()
    private var cometParticles = SKEmitterNode()
    private var starsField1Particles = SKEmitterNode()
    private var starsField2Particles = SKEmitterNode()
    private var starsField3Particles = SKEmitterNode()
    
    private init() {
        
    }
    
    private func setupMagicParticles() {
        
        self.magicParticles.particleBirthRate = 35.0
        self.magicParticles.particleLifetime = 5.0
        self.magicParticles.particleLifetimeRange = 1.25
        
        self.magicParticles.particlePositionRange = CGVectorMake(kViewSize.width * 2, kViewSize.height * 2)
        
        self.magicParticles.particleSpeed = -200.0
        self.magicParticles.particleSpeedRange = self.magicParticles.particleSpeed / 4
        
        self.magicParticles.emissionAngle = DegreesToRadians(degrees: 90.0)
        self.magicParticles.emissionAngleRange = DegreesToRadians(degrees: 15)
        
        self.magicParticles.particleAlpha = 0.5
        self.magicParticles.particleAlphaRange = 0.25
        self.magicParticles.particleAlphaSpeed = -0.125
        
        self.magicParticles.particleColorBlendFactor = 0.5
        self.magicParticles.particleColorBlendFactorRange = 0.25
        
        self.magicParticles.particleColor = Colors.colorFromRGB(rgbvalue: Colors.Magic)
        
        self.magicParticles.particleTexture = GameTextures.instance.interfaceAssets[InterfaceNameConstants.MAGIC]//GameTextures.sharedInstance.textureWithName(name: SpriteName.Magic)
        
    }
    
    private func setupStarsParticles() {
        
        self.starsParticles.particleBirthRate = 12.0
        self.starsParticles.particleLifetime = 5.0
        self.starsParticles.particleLifetimeRange = 1.25
        
        self.starsParticles.particlePositionRange = CGVectorMake(kViewSize.width * 2, kViewSize.height * 2)
        
        self.starsParticles.particleSpeed = -200.0
        self.starsParticles.particleSpeedRange = self.magicParticles.particleSpeed / 4
        
        self.starsParticles.emissionAngle = DegreesToRadians(degrees: 90.0)
        self.starsParticles.emissionAngleRange = DegreesToRadians(degrees: 15)
        
        self.starsParticles.particleAlpha = 1
        self.starsParticles.particleAlphaRange = 0.25
        self.starsParticles.particleAlphaSpeed = -0.5
        
        self.starsParticles.particleColorBlendFactor = 0.5
        self.starsParticles.particleColorBlendFactorRange = 0.25
        
        self.starsParticles.particleColor = SKColor.redColor() // Colors.colorFromRGB(rgbvalue: Colors.Stars)
        self.starsParticles.particleColorBlueRange = 255
        self.starsParticles.particleColorBlueSpeed = 0.125
        self.starsParticles.particleColorGreenRange = 11.75
        self.starsParticles.particleColorGreenSpeed = 1.125
        //self.starsParticles.particleColorSequence
        
        self.starsParticles.particleTexture = GameTextures.instance.interfaceAssets[InterfaceNameConstants.MAGIC]
        //self.starsParticles.zPosition = -13
        
    }
    
    private func setupCometParticles(){
        // Create path name to file with particle effect
        let sparkEmitterPath = NSBundle.mainBundle().pathForResource("FireEffect", ofType: "sks")!
        
        // Create SKEmitterNode from this file
        self.starsField1Particles = NSKeyedUnarchiver.unarchiveObjectWithFile(sparkEmitterPath) as! SKEmitterNode
        
        // Configure it
        self.starsField1Particles.position = CGPoint(x: kViewSize.width / 2, y: kViewSize.height)
        
        //self.starsField1Particles.particleSpeed = 30 * -1
        //self.starsField1Particles.particleLifetime = 1
        self.starsField1Particles.name = "sparkEmitter"
        self.starsField1Particles.zPosition = 0
        let action = SKAction.moveTo(CGPointMake(-400,-10), duration:5.0)
        let remove = SKAction.removeFromParent()
        self.starsField1Particles.runAction(SKAction.sequence([action, remove]))
    }
    
    
    private func setupStarsField1Particles() {
        
        self.starsField1Particles.particleBirthRate = 1
        self.starsField1Particles.particleLifetime = kViewSize.height * UIScreen.mainScreen().scale / 50
        self.starsField1Particles.particlePosition = CGPoint(x: kViewSize.width / 2, y: kViewSize.height / 2)
        self.starsField1Particles.particlePositionRange = CGVector(dx: kViewSize.width, dy: kViewSize.height)
        self.starsField1Particles.particleSpeed = 50 * -1
        self.starsField1Particles.particleAlpha = 0.75
        self.starsField1Particles.particleAlphaRange = 0.25
        self.starsField1Particles.particleAlphaSpeed = -0.125
        self.starsField1Particles.particleColorBlendFactor = 1
        self.starsField1Particles.particleColor = SKColor.lightGrayColor()
        self.starsField1Particles.particleTexture = GameTextures.instance.interfaceAssets[InterfaceNameConstants.STAR]
        self.starsField1Particles.particleScale = 0.1
        self.starsField1Particles.emissionAngle = DegreesToRadians(degrees: 90.0)
        self.starsField1Particles.emissionAngleRange = DegreesToRadians(degrees: 15.0)
    }
    
    
    private func setupStarsField2Particles() {
        
        self.starsField2Particles.particleBirthRate = 2
        self.starsField2Particles.particleLifetime = kViewSize.height * UIScreen.mainScreen().scale / 50
        self.starsField2Particles.particlePosition = CGPoint(x: kViewSize.width / 2, y: kViewSize.height / 2)
        self.starsField2Particles.particlePositionRange = CGVector(dx: kViewSize.width, dy: kViewSize.height)
        self.starsField2Particles.particleSpeed = 30 * -1
        self.starsField2Particles.particleAlpha = 0.75
        self.starsField2Particles.particleAlphaRange = 0.25
        self.starsField2Particles.particleAlphaSpeed = -0.125
        self.starsField2Particles.particleColorBlendFactor = 1
        self.starsField2Particles.particleColor = SKColor.grayColor()
        self.starsField2Particles.particleTexture = GameTextures.instance.interfaceAssets[InterfaceNameConstants.STAR]
        //GameTextures.sharedInstance.textureWithName(name: SpriteName.Star)
        self.starsField2Particles.particleScale = 0.07
        self.starsField2Particles.emissionAngle = DegreesToRadians(degrees: 75.0)
        self.starsField2Particles.emissionAngleRange = DegreesToRadians(degrees: 30.0)
    }
    
    private func setupStarsField3Particles() {
        
        // Determine the time a star is visible on screen
        let lifetime =  kViewSize.height * UIScreen.mainScreen().scale / 50
        
        // Create the emitter node
        //let emitterNode = SKEmitterNode()
        self.starsField3Particles.particleTexture = GameTextures.instance.interfaceAssets[InterfaceNameConstants.STAR]
        self.starsField3Particles.particleBirthRate = 4
        self.starsField3Particles.particleColor = SKColor.darkGrayColor()
        self.starsField3Particles.particleSpeed = 15 * -1
        self.starsField3Particles.particleScale = 0.05
        self.starsField3Particles.particleColorBlendFactor = 1
        self.starsField3Particles.particleLifetime = lifetime
        self.starsField3Particles.particlePosition = CGPoint(x: kViewSize.width / 2, y: kViewSize.height / 2)
        self.starsField3Particles.particlePositionRange = CGVector(dx: kViewSize.width, dy: kViewSize.height)
        
        // Fast forward the effect to start with a filled screen
        //self.starsField3Particles.advanceSimulationTime(1)
    }
    
    func createParticle(particles particles: Particles) -> SKEmitterNode {
        
        switch particles {
        case Particles.Magic:
            self.setupMagicParticles()
            return self.magicParticles.copy() as! SKEmitterNode
        case Particles.Stars:
            self.setupStarsParticles()
            return self.starsParticles.copy() as! SKEmitterNode
        case Particles.Comet:
            self.setupCometParticles()
            return self.cometParticles.copy() as! SKEmitterNode
        case Particles.StarsField1:
            self.setupStarsField1Particles()
            return self.starsField1Particles.copy() as! SKEmitterNode
        case Particles.StarsField2:
            self.setupStarsField2Particles()
            return self.starsField2Particles.copy() as! SKEmitterNode
        case Particles.StarsField3:
            self.setupStarsField3Particles()
            return self.starsField3Particles.copy() as! SKEmitterNode
        }
    }
    
    
}
