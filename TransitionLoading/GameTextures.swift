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
 
    private var spritesAtlasLivello1 = SKTextureAtlas()
    private var spritesAtlasInterface = SKTextureAtlas()
    
    /*
     This is a plain class because it's not inherit from any other class, so we can just use init().
     I make it private because it's a singleton class.
     */
    private init(){
        
        /*
         I set my private const with the name of the Atlas.
         */
        self.spritesAtlasLivello1 = SKTextureAtlas(named: "Sprites")
        self.spritesAtlasInterface = SKTextureAtlas(named: "Interface")
    }
    
    // This func get a string and return a SKTexture
    func textureWithName(name name: String) -> SKTexture {
        return SKTexture(imageNamed: name)
    }
    
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
        // NSURL(fileURLWithPath: filename!).URLByDeletingPathExtension?
        }
        print(textures)
        return textures
    }
    
    func loadLevel1Assets() {
        spriteAssets = getAssetsDictionaryFromAtlasNamed(AtlasNameConstants.SPRITE_ATLAS)
        interfaceAssets = getAssetsDictionaryFromAtlasNamed(AtlasNameConstants.INTERFACE_ATLAS)
        //Textures that are not part of the atlas but should be part of level1 assets can be added here:
        //level1Assets[FileNameConstants.SOME_TEXTURE2] = SKTexture(imageNamed: FileNameConstants.SOME_TEXTURE2)
        //print("Inter",interfaceAssets)
        
    }
    func unloadLevel1Assets() {
        spriteAssets = nil
    }

    
}