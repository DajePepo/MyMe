//
//  Navigator.swift
//  Caregivers
//
//  Created by Pietro Santececca on 16.10.18.
//  Copyright © 2018 Tecnojam. All rights reserved.
//

import UIKit
import RxCocoa

class Navigator {
    
    lazy private var defaultStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    // MARK: - Segues list
    enum Segue {
        case initialLoadingView
        case initialLoginView
        case initialCompassView
        case alertView(String, String)
    }
    
    // Push a view controller
    private func push(target: UIViewController, sender: UIViewController) {
        if let nav = sender as? UINavigationController {
            nav.pushViewController(target, animated: false)
            return
        }
        
        if let nav = sender.navigationController {
            nav.pushViewController(target, animated: true)
        } else {
            sender.present(target, animated: true, completion: nil)
        }
    }
    
    // Present a view controller
    private func present(target: UIViewController, sender: UIViewController, animated: Bool? = true) {
        sender.present(target, animated: true, completion: nil)
    }
    
    // Hide (dismis, pop) a view controller
    private func hide(sender: UIViewController) {
        if let nav = sender.navigationController, let rootViewController = nav.viewControllers.first, sender != rootViewController {
            nav.popViewController(animated: true)
        } else {
            sender.dismiss(animated: true, completion: nil)
        }
    }
    
    private func rebase(target: UIViewController) {
        appDelegate?.setInitialViewController(target)
    }
    
    // MARK: - Invoke a single segue
    func show(_ segue: Segue, sender: UIViewController? = nil) {
        switch segue {
        case .initialLoadingView:
            rebase(target: LoadingViewController.createWith(storyboard: defaultStoryboard))
        
        case .initialLoginView:
            let vm = LoginViewModel()
            rebase(target: LoginViewController.createWith(navigator: self, storyboard: defaultStoryboard, viewModel: vm))
        
        case .initialCompassView:
            let vm = CompassViewModel()
            rebase(target: CompassViewController.createWith(navigator: self, storyboard: defaultStoryboard, viewModel: vm))
            
        case .alertView(let title, let message):
            guard let sender = sender else { return }
            let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(target: alertView, sender: sender)
        }
     }
}


