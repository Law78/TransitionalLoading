//
//  SpriteNames.swift
//  TransitionLoading
//
//  Created by Lorenzo on 01/09/16.
//  Copyright © 2016 Lorenzo Franceschini. All rights reserved.
//
import Foundation
import SpriteKit

class GameTextures {
    
    static let instance = GameTextures()
    
    var Player: String { return "Player" }
    var Enemy: String { return "Enemey" }
 
     /*
     This is a plain class because it's not inherit from any other class, so we can just use init().
     I make it private because it's a singleton class.
     */
    private init(){}
    
    // This func get a string and return a SKTexture
    /*func textureWithName(name name: String) -> SKTexture {
        return SKTexture(imageNamed: name)
    }
     */
    
    // This func get a string and return a SKSpriteNode
    func spriteWithName(name name: String) -> SKSpriteNode {
        return SKSpriteNode(imageNamed: name)
    }
    
    
    private(set) var spriteAssets: [String : SKTexture]!
    private(set) var interfaceAssets: [String : SKTexture]!
    
    func getAssetsDictionaryFromAtlasNamed(atlasNamed: String) -> [String : SKTexture] {
        let atlas = SKTextureAtlas(named: atlasNamed)
        var textures: [String : SKTexture] = Dictionary(minimumCapacity: atlas.textureNames.count)
        for textureName in atlas.textureNames as [String] {
            textures[NSURL(fileURLWithPath: textureName).URLByDeletingPathExtension!.lastPathComponent!] = atlas.textureNamed(textureName)
        }
        print(textures)
        return textures
    }
    
    func loadInterfaceAssets() {
        interfaceAssets = getAssetsDictionaryFromAtlasNamed(AtlasNameConstants.INTERFACE_ATLAS)
        //Textures that are not part of the atlas but should be part of level1 assets can be added here:
        //level1Assets[FileNameConstants.SOME_TEXTURE2] = SKTexture(imageNamed: FileNameConstants.SOME_TEXTURE2)
    }
    
    
    func loadLevel1Assets() {
        spriteAssets = getAssetsDictionaryFromAtlasNamed(AtlasNameConstants.SPRITE_ATLAS)
    }
    
    func unloadInterfaceAssets() {
        spriteAssets = nil
    }
    
    func unloadLevel1Assets() {
        spriteAssets = nil
    }

    
}