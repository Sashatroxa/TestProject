//
//  ViewController.swift
//  TestProject
//
//  Created by Александр on 15.03.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    private lazy var mainView = self.view as? MainView
    
    private let textsReuseIdentifierTableView = "textsCellTableView"
    private let imageReuseIdentifierTableView = "imageCellTableView"
    
    private var dataModel: MainModel?
    private var imageArray = [UIImage]()
    
    override func loadView() {
        let view = MainView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAndCachingContent()
        self.setupUI()
        self.mainView?.tableView.reloadData()
    }
    
    func setupUI() {
        self.mainView?.tableView.estimatedRowHeight = 100
        self.mainView?.tableView.rowHeight = UITableView.automaticDimension
        self.mainView?.tableView.tableFooterView = UIView()
        self.mainView?.tableView.delegate = self
        self.mainView?.tableView.dataSource = self
        self.mainView?.tableView.register(MainCell.self, forCellReuseIdentifier: self.textsReuseIdentifierTableView)
        self.mainView?.tableView.register(ImagesMainCell.self, forCellReuseIdentifier: self.imageReuseIdentifierTableView)
    }
    
// MARK: - Fetch content
    
    func fetchAndCachingContent(){
        fetchData(){ result in
            switch result {
            case .success(let data):
                self.dataModel = data
                for index in 0..<data.content.count {
                    if data.content[index].sectionTitle == "Images" {
                        for i in 0..<(self.dataModel?.content[index].images!.count)! {
                            self.imageArray.append(UIImage.init(url: (self.dataModel?.content[index].images?[i])!)!)
                        }
                    }
                }
                self.mainView?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.dataModel?.content[section]
        if data?.sectionTitle == "Texts"{
            return data?.texts?.count ?? 0
        } else if data?.sectionTitle == "Images"{
            return data?.images?.count ?? 0
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataModel?.content.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textsCell = tableView.dequeueReusableCell(withIdentifier: self.textsReuseIdentifierTableView, for: indexPath) as? MainCell
        let imageCell = tableView.dequeueReusableCell(withIdentifier: self.imageReuseIdentifierTableView, for: indexPath) as? ImagesMainCell
        let data = self.dataModel?.content[indexPath.section]
        
        if indexPath.row < data?.texts?.count ?? 0
            &&  data?.sectionTitle == "Texts" {
            textsCell?.textsLabel.text = data?.texts?[indexPath.row]
            return textsCell ?? UITableViewCell()
        } else if data?.sectionTitle == "Images" {
            imageCell?.photoImageView.image = self.imageArray[indexPath.row]
            return imageCell ?? UITableViewCell()
        }
        return textsCell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.dataModel?.content[indexPath.section]
        
        if data?.sectionTitle == "Texts" {
            let vc = DetailTextsViewController(text: (data?.texts?[indexPath.row])!)
            self.navigationController?.pushViewController(vc, animated: true)
        } else if data?.sectionTitle == "Images" {
            let vc = DetailImageViewController(image: self.imageArray[indexPath.row])
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
}

