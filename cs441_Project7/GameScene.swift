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
            scoreLabel.text = "\(score)"
        }
    }
    
    let bg1 = SKSpriteNode(imageNamed: "space")
    let bg2 = SKSpriteNode(imageNamed: "space")
    let bg3 = SKSpriteNode(imageNamed: "space")
    let planet = SKSpriteNode(imageNamed: "planet")
    let ship = SKSpriteNode(imageNamed: "ship")
    var touchLocation = CGPoint()
    
    override func didMove(to view: SKView) {
//        bg1.anchorPoint = CGPoint.zero
//        bg1.position = CGPoint(x: -400, y: -600)
//        bg1.zPosition = -3
//        addChild(bg1)
//
//        bg2.anchorPoint = CGPoint.zero
//        bg2.position = CGPoint(x: -400, y: bg1.size.height - 600)
//        bg2.zPosition = -3
//        addChild(bg2)
        
//        bg3.zPosition = -4
//        bg3.position = CGPoint(x: 75, y: 0)
//        addChild(bg3)
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(moveBackground), SKAction.wait(forDuration: 1.08)])))
        
        planet.position = CGPoint(x: 110, y: 450)
        planet.zPosition = -1
        planet.name = "planet"
        addChild(planet)
        
        ship.position = CGPoint(x: 0, y : -500)
        ship.zPosition = 1
        ship.name = "ship"
        addChild(ship)
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(shootLaser), SKAction.wait(forDuration: 0.3)])))
    }
    
    func moveBackground(){
        let gameBG1 = SKSpriteNode(imageNamed: "space")
        let gameBG2 = SKSpriteNode(imageNamed: "space")
        
        gameBG1.zPosition = -3
        gameBG1.position = CGPoint(x: 75, y: -500)
        gameBG2.zPosition = -2
        gameBG2.position = CGPoint(x: 75, y: 750)
        addChild(gameBG1)
        addChild(gameBG2)
        
        let duration = CGFloat(8.0)
        
        let move = SKAction.move(to: CGPoint(x: 75, y: -5000), duration: TimeInterval(duration))
        let finish = SKAction.removeFromParent()
        let move2 = SKAction.move(to: CGPoint(x: 75, y: -5000), duration: TimeInterval(duration))
        let finish2 = SKAction.removeFromParent()
        
        gameBG1.run(SKAction.sequence([move, finish]))
        gameBG2.run(SKAction.sequence([move2, finish2]))
    }
    
    func moveShip(){
        ship.position.x = (touchLocation.x)
    }
    
    func shootLaser(){
        let laser = SKSpriteNode(imageNamed: "laser")
        
        laser.zPosition = 0
        laser.position = CGPoint(x: ship.position.x, y: -495)
        addChild(laser)
        
        let shoot = SKAction.move(to: CGPoint(x: ship.position.x, y: 750), duration: 0.4)
        let remove = SKAction.removeFromParent()
        laser.run(SKAction.sequence([shoot, remove]))
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
//        bg1.position = CGPoint(x: bg1.position.x, y: bg1.position.y - 5)
//        bg2.position = CGPoint(x: bg2.position.x, y: bg2.position.y - 5)
//
//                    if(bg1.position.y < -bg1.size.height)
//                    //if(bg1.position.y < -100)
//                    {
//                        bg1.position = CGPoint(x: bg2.position.x, y: bg1.position.y + bg2.size.height)
//                    }
//
//                    if(bg2.position.y < -bg2.size.height)
//                    //if(bg2.position.y < -600)
//                    {
//                        bg2.position = CGPoint(x: bg1.position.x, y: bg2.position.y + bg1.size.height)
//
//                    }
    }
}
