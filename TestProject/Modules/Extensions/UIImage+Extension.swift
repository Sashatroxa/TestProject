//
//  UIImageView+Extension.swift
//  TestProject
//
//  Created by Александр on 16.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(url: String) {
        guard let url = URL(string: url) else { return nil }
        let imageData = try? Data(contentsOf: url)
        self.init(data: imageData!)
    }
}

