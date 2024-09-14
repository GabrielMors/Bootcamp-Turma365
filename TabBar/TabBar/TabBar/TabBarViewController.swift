//
//  TabBarViewController.swift
//  TabBar
//
//  Created by Gabriel Mors  on 9/13/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addController()
        configLayout()
    }
    
    private func addController() {
        
        let firstViewController: UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: tela01ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: tela01ViewController.self)) as? tela01ViewController
            let navigation = UINavigationController(rootViewController: viewController ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Tela 01", image: UIImage(systemName: "house"), tag: 0)
            
            return navigation
        }()
        
        let segundViewController: UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: Tela02ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela02ViewController.self)) as? Tela02ViewController
            let navigation = UINavigationController(rootViewController: viewController ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Tela 02", image: UIImage(systemName: "trash.fill"), tag: 1)
            
            return navigation
        }()
        
        let lastViewController: UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: Tela03ViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: Tela03ViewController.self)) as? Tela03ViewController
            let navigation = UINavigationController(rootViewController: viewController ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Tela 03", image: UIImage(systemName: "person.fill"), tag: 2)
            
            return navigation
        }()
        
        viewControllers = [firstViewController, segundViewController, lastViewController]
    }
    
    private func configLayout() {
        tabBar.layer.borderWidth = 5.0
        tabBar.layer.borderColor = UIColor.white.cgColor
        tabBar.selectedItem?.badgeColor = .green
    }
    
}
