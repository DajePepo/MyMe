//
//  LoadingViewController.swift
//  MyMe
//
//  Created by Pietro Santececca on 21.02.19.
//  Copyright © 2019 Tecnojam. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    static func createWith(storyboard: UIStoryboard) -> LoadingViewController {
        return storyboard.instantiateViewController(ofType: LoadingViewController.self)
    }

}
