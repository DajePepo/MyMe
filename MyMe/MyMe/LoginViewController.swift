//
//  LoginViewController.swift
//  MyMe
//
//  Created by Pietro Santececca on 19.02.19.
//  Copyright © 2019 Tecnojam. All rights reserved.
//

import UIKit
import FacebookLogin
import Apollo
import RxSwift
import RxCocoa
import Then

class LoginViewController: UIViewController {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate var navigator: Navigator!
    var viewModel: LoginViewModel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    static func createWith(navigator: Navigator, storyboard: UIStoryboard, viewModel: LoginViewModel) -> LoginViewController {
        return storyboard.instantiateViewController(ofType: LoginViewController.self).then { vc in
            vc.navigator = navigator
            vc.viewModel = viewModel
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    func bindUI() {
        loginButton.rx.tap
            .throttle(0.5, scheduler: MainScheduler.instance)
            .subscribe(onNext: { [unowned self] in
                DataManager.loginWithFacebook(success: {
                    self.navigator.show(.initialCompassView)
                }, failure: {
                    self.navigator.show(.alertView("Error", "Login failed!!"), sender: self)
                })
            })
            .disposed(by: disposeBag)
    }
    
}
