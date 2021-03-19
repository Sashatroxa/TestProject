//
//  MainCell.swift
//  TestProject
//
//  Created by Александр on 15.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import UIKit
import SnapKit

class MainCell: UITableViewCell {
    
    lazy var view: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var textsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUI()
        self.addSubviews()
        self.makeConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.view)
        self.view.addSubview(self.textsLabel)
    }
    
    private func makeConstraints() {
        self.view.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        self.textsLabel.snp.makeConstraints { make in
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            make.top.equalTo(contentView).offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    private func setupUI() {
        self.layer.cornerRadius = 5
        self.separatorInset = UIEdgeInsets.init(top: 0.0, left: 25.0, bottom: 0.0, right: 25.0)
        self.layoutMargins = UIEdgeInsets.init(top: 0.0, left: 100.0, bottom: 0.0, right: 0.0)
    }
}
