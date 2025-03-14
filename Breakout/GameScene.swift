//
//  GameScene.swift
//  Breakout
//
//  Created by Carson Payne on 3/13/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var ball = SKShapeNode()
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        createBackground()
        resetGame()
    }
    func createBackground() {
        let stars = SKTexture(imageNamed: "Stars")
        for i in 0...1 {
            let starsBackground = SKSpriteNode(texture: stars)
            starsBackground.zPosition = -1
            starsBackground.position = CGPoint(x:0, y: stars.size().height * CGFloat(i))
            addChild(starsBackground)
            let moveDown = SKAction.moveBy(x: 0, y: -starsBackground.size.height, duration: 20)
            let moveReset = SKAction.moveBy (x: 0, y:starsBackground.size.height, duration: 0)
            let moveLoop = SKAction.sequence ([moveDown, moveReset])
            let moveForever = SKAction.repeatForever (moveLoop)
            starsBackground.run(moveForever)
        }
    }
    func makeBall () {
        ball.removeFromParent ()
        ball = SKShapeNode(circleOfRadius: 10)
        ball.position = CGPoint(x: frame.midX, y: frame.midY)
        ball.strokeColor = .black
        ball.fillColor = .yellow
        ball.name = "ball"
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        ball.physicsBody?.isDynamic = false
        ball.physicsBody?.usesPreciseCollisionDetection = true
        ball.physicsBody?.friction = 0
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
        addChild(ball)
    }
    func resetGame () {
        // this stuff happens before each game starts
        makeBall ()
    }
}
