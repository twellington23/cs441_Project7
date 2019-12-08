//
//  GameScene.swift
//  cs441_Project7
//
//  Created by Tyler Wellington on 12/4/19.
//  Copyright © 2019 Tyler Wellington. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var scoreLabel: SKLabelNode!

    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    //let gameBG = SKSpriteNode(imageNamed: "space")
    let planet = SKSpriteNode(imageNamed: "planet")
    let ship = SKSpriteNode(imageNamed: "ship")
    let laser = SKSpriteNode(imageNamed: "laser")
    var touchLocation = CGPoint()
    
    override func didMove(to view: SKView) {
        //gameBG.position = CGPoint(x: size.width * 0.2, y: size.width * 0.1)
//        gameBG.position = CGPoint(x: 75, y: 0)
//        gameBG.zPosition = -1
//        gameBG.name = "gameBG"
//        addChild(gameBG)
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(moveBackground), SKAction.wait(forDuration: 0.75)])))
        
        planet.position = CGPoint(x: 110, y: 450)
        planet.zPosition = -1
        planet.name = "planet"
        addChild(planet)
        
        ship.position = CGPoint(x: 0, y : -500)
        ship.zPosition = 0
        ship.name = "ship"
        addChild(ship)
        
        laser.position = CGPoint(x: 0, y: -445)
        addChild(laser)
    }
    
    func moveBackground(){
        let gameBG1 = SKSpriteNode(imageNamed: "space")
        //let gameBG2 = SKSpriteNode(imageNamed: "space")
        
        gameBG1.zPosition = -2
        gameBG1.position = CGPoint(x: 75, y: 0)
        //gameBG2.zPosition = -1
        //gameBG2.position = CGPoint(x: 75, y: 500)
        addChild(gameBG1)
        //addChild(gameBG2)
        
        let duration = CGFloat(8.0)
        let move = SKAction.move(to: CGPoint(x: 75, y: -7500), duration: TimeInterval(duration))
        let finish = SKAction.removeFromParent()
        gameBG1.run(SKAction.sequence([move, finish]))
    }
    
    func moveShip(){
        ship.position.x = (touchLocation.x)
    }
    
    func shootLaser(){
        //let shoot = SKAction.mo
    }
    
    func spawnEnemies(){
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            touchLocation = touch.location(in: self)
            
            moveShip()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {}
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
