//
//  ContainerViewController.swift
//  Sushi App
//
//  Created by Алексей Пархоменко on 25/02/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, FoodViewControllerDelegate {
    
    var foodViewController: UIViewController! // controller in video
    var menuViewController: UIViewController!
    var isMove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureFoodViewController()
    }

    func configureFoodViewController() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! FoodViewController
        viewController.delegate = self
        foodViewController = viewController
        addChild(foodViewController)
        view.addSubview(foodViewController.view)
        foodViewController.didMove(toParent: self)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            addChild(menuViewController)
            view.insertSubview(menuViewController.view, at: 0)
            menuViewController.didMove(toParent: self)
            print("Добавили menuViewController")
        }
    }
    
    func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            // показываем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.foodViewController.view.frame.origin.x = self.foodViewController.view.frame.width - 140
            }) { (finished) in
                
            }
        } else {
            // убираем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.foodViewController.view.frame.origin.x = 0
            }) { (finished) in

            }
        }
    }
    
    // MARK: FoodViewControllerDelegate
    
    func toggleMenu() {
        
        configureMenuViewController()
        isMove = !isMove
        showMenuViewController(shouldMove: isMove)
    }
    
}
