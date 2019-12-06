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
    
    let gameBG = SKSpriteNode(imageNamed: "space")
    let planet = SKSpriteNode(imageNamed: "planet")
    let ship = SKSpriteNode(imageNamed: "ship")
    let laser = SKSpriteNode(imageNamed: "laser")
    
    override func didMove(to view: SKView) {
        //gameBG.position = CGPoint(x: size.width * 0.2, y: size.width * 0.1)
        gameBG.position = CGPoint(x: 75, y: 0)
        gameBG.zPosition = -1
        gameBG.name = "gameBG"
        addChild(gameBG)
        
        planet.position = CGPoint(x: 110, y: 450)
        planet.zPosition = -1
        planet.name = "planet"
        addChild(planet)
        
        ship.position = CGPoint(x: 0, y : -550)
        ship.zPosition = 0
        ship.name = "ship"
        addChild(ship)
        
        laser.position = CGPoint(x: 0, y: -495)
        addChild(laser)
        
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
