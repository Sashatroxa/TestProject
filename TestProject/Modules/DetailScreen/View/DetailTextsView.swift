//
//  DetailView.swift
//  TestProject
//
//  Created by Александр on 15.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import UIKit

class DetailTextsView: UIView {
    
    lazy var textsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
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
        self.addSubview(self.textsLabel)
    }
    
    private func makeConstraints() {
        self.textsLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
        }
    
    }
}
