//
//  TodoTVCell.swift
//  Todo_UIKit
//
//  Created by Chung Wussup on 5/24/24.
//

import UIKit

class TodoTVCell: UITableViewCell {
    private let checkBoxButton: UIButton = {
        let button = UIButton(type: .custom)
        
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setupUI() {
        [checkBoxButton, titleLabel, contentsLabel, dateLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            checkBoxButton.widthAnchor.constraint(equalToConstant: 20),
            checkBoxButton.heightAnchor.constraint(equalToConstant: 30),
            
            checkBoxButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBoxButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            contentsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            contentsLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 5),
            contentsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: contentsLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        
        
        
    }
    
    func setupCell(todo: Todo) {
        titleLabel.text = todo.title
        contentsLabel.text = todo.content
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: todo.date)
        dateLabel.text = dateString
        
        let checkBoxImage = todo.isCompleted ? "checkmark.rectangle" : "rectangle"
        checkBoxButton.setImage(UIImage(systemName: checkBoxImage), for: .normal)
        
    }
    
    
}
