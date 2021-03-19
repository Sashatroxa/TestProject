//
//  DetailTextsViewController.swift
//  TestProject
//
//  Created by Александр on 18.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import UIKit

class DetailTextsViewController: UIViewController {
    
    lazy var detailView = self.view as? DetailTextsView
    var text: String
    
    init(text: String) {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = DetailTextsView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailView?.textsLabel.text = self.text
        
    }
    
}
