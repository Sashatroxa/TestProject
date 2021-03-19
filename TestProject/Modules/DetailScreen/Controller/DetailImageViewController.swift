//
//  DetailViewController.swift
//  TestProject
//
//  Created by Александр on 15.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import UIKit
import SnapKit

class DetailImageViewController: UIViewController {
    
    lazy var detailView = self.view as? DetailImageView
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = DetailImageView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailView?.image.image = self.image
    }
}
