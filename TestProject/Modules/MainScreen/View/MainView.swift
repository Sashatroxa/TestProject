//
//  MainView.swift
//  TestProject
//
//  Created by Александр on 15.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var tableView = UITableView()
    
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
        [tableView].forEach {self.addSubview($0)}
    }
    
    private func makeConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.bottom.right.left.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

