//
//  GameScene.swift
//  cs441_Project7
//
//  Created by Tyler Wellington on 12/4/19.
//  Copyright © 2019 Tyler Wellington. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
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
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(moveBackground), SKAction.wait(forDuration: 1.08)])))
        
        scoreLabel = SKLabelNode(fontNamed: "Courier")
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: -235, y: 575)
        scoreLabel.zPosition = 5
        addChild(scoreLabel)
        
        planet.position = CGPoint(x: 110, y: 450)
        planet.zPosition = -1
        planet.name = "planet"
        addChild(planet)
        
        ship.position = CGPoint(x: 0, y : -500)
        ship.zPosition = 1
        ship.name = "ship"
        ship.physicsBody = SKPhysicsBody(rectangleOf: ship.size)
        ship.physicsBody?.isDynamic = false
        addChild(ship)
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(shootLaser), SKAction.wait(forDuration: 0.3)])))
        
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(spawnEnemies), SKAction.wait(forDuration: 1.5)])))
        
        //titleDisplay()
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
    
    func titleDisplay(){
        let wtext = SKSpriteNode(imageNamed: "wtext")
        let ytext = SKSpriteNode(imageNamed: "ytext")
        let gtext = SKSpriteNode(imageNamed: "gtext")
        wtext.position = CGPoint(x: 20, y: 20)
        wtext.zPosition = 2
        ytext.position = CGPoint(x: 10, y: 10)
        ytext.zPosition = 1
        gtext.position = CGPoint(x: 0, y: 0)
        gtext.zPosition = 0
        
        addChild(wtext)
        addChild(ytext)
        addChild(gtext)
    }
    
    func moveShip(){
        ship.position.x = (touchLocation.x)
    }
    
    func shootLaser(){
        let laser = SKSpriteNode(imageNamed: "laser")
        
        laser.zPosition = 0
        laser.position = CGPoint(x: ship.position.x, y: -495)
        laser.physicsBody = SKPhysicsBody(rectangleOf: laser.size)
        laser.physicsBody?.isDynamic = false
        laser.physicsBody!.contactTestBitMask = laser.physicsBody!.collisionBitMask
        addChild(laser)
        
        let shoot = SKAction.move(to: CGPoint(x: ship.position.x, y: 750), duration: 0.4)
        let remove = SKAction.removeFromParent()
        laser.run(SKAction.sequence([shoot, remove]))
    }
    
    func spawnEnemies(){
        let e1 = SKSpriteNode(imageNamed: "benemy")
        let e2 = SKSpriteNode(imageNamed: "oenemy")
        let e3 = SKSpriteNode(imageNamed: "renemy")
        let enemy = Int.random(in: 1 ... 3)
        let num = Int.random(in: -4 ... 4)
        let speed = CGFloat.random(in: 2.0 ... 6.0)
        
        e1.position = CGPoint(x: 65 * num, y: 750)
        e1.zPosition = 1
        e1.name = "e1"
        e1.physicsBody = SKPhysicsBody(rectangleOf: e1.size)
        e1.physicsBody?.isDynamic = false //maybe true??
        
        e2.position = CGPoint(x: 65 * num, y: 750)
        e2.zPosition = 1
        e2.name = "e2"
        e2.physicsBody = SKPhysicsBody(rectangleOf: e2.size)
        e2.physicsBody?.isDynamic = false
        
        e3.position = CGPoint(x: 65 * num, y: 750)
        e3.zPosition = 1
        e3.name = "e3"
        e3.physicsBody = SKPhysicsBody(rectangleOf: e3.size)
        e3.physicsBody?.isDynamic = false
        
        let move1 = SKAction.move(to: CGPoint(x: e1.position.x, y: -750), duration: TimeInterval(speed))
        let move2 = SKAction.move(to: CGPoint(x: e2.position.x, y: -750), duration: TimeInterval(speed))
        let move3 = SKAction.move(to: CGPoint(x: e3.position.x, y: -750), duration: TimeInterval(speed))
        let remove = SKAction.removeFromParent()
        
        if enemy == 1{
            addChild(e1)
            e1.run(SKAction.sequence([move1, remove]))
        }else if enemy == 2{
            addChild(e2)
            e2.run(SKAction.sequence([move2, remove]))
        }else{
            addChild(e3)
            e3.run(SKAction.sequence([move3, remove]))
        }
    }
    
    func collisionBetween(object1: SKNode, object2: SKNode) {
//        if (object1.name == "laser" && (object2.name == "e1" || object2.name == "e2" || object2.name == "e3")) {
//            destroy(object: object1)
//            destroy(object: object2)
//
//            score += 250
//        }
        
//        if object.name == "e1" {
//            destroy(object: laser)
//            destroy(object: object)
//
//            score += 250
//        }
        
        titleDisplay()
    }
    
    func destroy(object: SKNode) {
        object.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }

        if nodeA.name == "laser" {
            collisionBetween(object1: nodeA, object2: nodeB)
        } else if nodeB.name == "laser" {
            collisionBetween(object1: nodeB, object2: nodeA)
        }
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
        score += 1
    }
}
