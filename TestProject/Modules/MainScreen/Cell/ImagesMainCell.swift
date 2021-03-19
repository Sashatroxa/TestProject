//
//  ImagesMainCell.swift
//  TestProject
//
//  Created by Александр on 16.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import Foundation

import UIKit
import SnapKit

class ImagesMainCell: UITableViewCell {
    
    lazy var view: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUI()
        self.addSubviews()
        self.makeConstraints()
    }
    
    private func addSubviews() {
        self.contentView.addSubview(self.view)
        self.view.addSubview(self.photoImageView)
    }
    
    private func makeConstraints() {
        self.view.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        self.photoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.height.width.equalTo(100)
        }
    }
    
    private func setupUI() {
        self.layer.cornerRadius = 5
        self.separatorInset = UIEdgeInsets.init(top: 0.0, left: 25.0, bottom: 0.0, right: 25.0)
        self.layoutMargins = UIEdgeInsets.init(top: 0.0, left: 100.0, bottom: 0.0, right: 0.0)
    }
}
