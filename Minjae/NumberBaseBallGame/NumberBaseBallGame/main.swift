import Foundation

// 프로토콜 주입 및 게임 실행
let gameLogic = GameLogic()
let gameContent = GameContent()
let gameManager = BaseBallGameManager()
gameContent.delegate = gameLogic
gameManager.gameContent = gameContent
gameManager.start()
