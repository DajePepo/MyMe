//
//  Storyboard+.swift
//  Caregivers
//
//  Created by Pietro Santececca on 16.10.18.
//  Copyright © 2018 Tecnojam. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: type)) as! T
    }
}
