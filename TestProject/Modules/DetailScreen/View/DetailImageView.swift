//
//  DetailImageView.swift
//  TestProject
//
//  Created by Александр on 18.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import UIKit

class DetailImageView: UIView {
    
    lazy var image = UIImageView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
        self.addSubviews()
        self.makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
    }
    
    private func addSubviews() {
        self.addSubview(self.image)
    }
    
    private func makeConstraints() {
        self.image.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(140)
        }
    }
}
