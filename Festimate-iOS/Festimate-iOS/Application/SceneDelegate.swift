//
//  SceneDelegate.swift
//  Festimate-iOS
//
//  Created by 김민서 on 10/2/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
    // 1.
        guard let windowScene = (scene as? UIWindowScene) else { return }
    // 2.
        self.window = UIWindow(windowScene: windowScene)
    // 3.
        let navigationController = UINavigationController(rootViewController: MainViewController())
        self.window?.rootViewController = navigationController
    // 4.
        self.window?.makeKeyAndVisible()
    }
}
