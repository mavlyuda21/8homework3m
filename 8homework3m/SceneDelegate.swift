//
//  SceneDelegate.swift
//  8homework3m
//
//  Created by mavluda on 1/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let mainVC = MainViewController()
        let mainBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.fill"),
                                         selectedImage: UIImage(systemName: "person.fill"))
        let recentBarItem = UITabBarItem(title: "Recents", image: UIImage(systemName: "clock.fill"),
                                         selectedImage: UIImage(systemName: "clock.fill"))
        let favoritesBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"),
                                         selectedImage: UIImage(systemName: "star.fill"))
        let dialpadBarItem = UITabBarItem(title: "Dialpad", image: UIImage(systemName: "circle.grid.3x3"),
                                         selectedImage: UIImage(systemName: "circle.grid.3x3.fill"))
        let voicemailBarItem = UITabBarItem(title: "Voicemail", image: UIImage(systemName: "recordingtape"),
                                         selectedImage: UIImage(systemName: "recordingtape"))
        mainVC.tabBarItem = mainBarItem
        let navigationController = UINavigationController(rootViewController: mainVC)
        
        let favoritesVC = EmptyViewController()
        favoritesVC.tabBarItem = favoritesBarItem
        
        let recentVC = EmptyViewController()
        recentVC.tabBarItem = recentBarItem
        
        let dialpadVC = EmptyViewController()
        dialpadVC.tabBarItem = dialpadBarItem
        
        let voicemailVC = EmptyViewController()
        voicemailVC.tabBarItem = voicemailBarItem
        
        let backItem = UIBarButtonItem()
        backItem.title = "Contacts"
        navigationController.navigationItem.backBarButtonItem = backItem
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [favoritesVC,recentVC,navigationController,dialpadVC,voicemailVC]
        tabbarController.tabBar.backgroundColor = .systemGray6
        tabbarController.selectedViewController = navigationController
        window.rootViewController = tabbarController
        tabbarController.tabBar.layer.cornerRadius = 24
        tabbarController.tabBar.clipsToBounds = true
        self.window = window
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

