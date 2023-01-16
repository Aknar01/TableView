//
//  MyTableViewCell.swift
//  TableView
//
//  Created by Aknar Assanov on 16.01.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    private let myBurgers: [String] = ["burger1", "burger2", "burger3", "burger4", "burger5"]
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    lazy var myLabel2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    lazy var myImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(with string: String) {
        myLabel.text = string
    }

}

//MARK: - Setup views and constraints methods

private extension MyTableViewCell {
    func setupViews() {
        contentView.addSubview(myImage)
        contentView.addSubview(myLabel)
        contentView.addSubview(myLabel2)
    }
    
    func setupConstraints() {
        myImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        myLabel.snp.makeConstraints { make in
            make.bottom.top.trailing.equalToSuperview()
            make.leading.equalTo(myImage.snp.trailing)
        }
        myLabel2.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalTo(myLabel.snp.leading)
            make.top.equalTo(myImage.snp.bottom).offset(20)
        }
    }
}
