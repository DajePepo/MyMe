//
//  CompassViewController.swift
//  MyMe
//
//  Created by Pietro Santececca on 21.02.19.
//  Copyright © 2019 Tecnojam. All rights reserved.
//

import UIKit
import Apollo
import RxSwift
import RxCocoa
import Then

class CompassViewController: UIViewController {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate var navigator: Navigator!
    var viewModel: CompassViewModel!
    
    static func createWith(navigator: Navigator, storyboard: UIStoryboard, viewModel: CompassViewModel) -> CompassViewController {
        return storyboard.instantiateViewController(ofType: CompassViewController.self).then { vc in
            vc.navigator = navigator
            vc.viewModel = viewModel
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
