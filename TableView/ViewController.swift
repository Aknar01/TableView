//
//  ViewController.swift
//  TableView
//
//  Created by Aknar Assanov on 12.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        return tableView
    }()
    
    struct Burger {
        var name: String
        var title: String
        var price: String
    }
    
    let data: [Burger] = [
        Burger(name: "burger1", title: "gamburger", price: "Price 10$"),
        Burger(name: "burger2", title: "cheese burger", price: "Price 12$"),
        Burger(name: "burger3", title: "burger", price: "Price 8$"),
        Burger(name: "burger4", title: "double cheese burger", price: "Price 15$"),
        Burger(name: "burger5", title: "cow burger", price: "Price 11$")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTableViewCell()
        cell.setText(with: data[indexPath.row].title)
        cell.myImage.image = UIImage(named: data[indexPath.row].name)
        cell.myLabel.text = data[indexPath.row].price
        cell.myLabel2.text = data[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
}

//MARK: - Setup views and constraints methods

private extension ViewController {
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
