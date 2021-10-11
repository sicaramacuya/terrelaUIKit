//
//  PictureCell.swift
//  terrela
//
//  Created by Eric Morales on 10/9/21.
//

import UIKit

class PictureCell: UITableViewCell {
    
    // MARK: Properties
    static var identifier: String = "APOD Cell"
    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.backgroundColor = .systemGray6
        
        return stackView
    }()
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.image = UIImage(named: "placeholder")
        
        return image
    }()
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.backgroundColor = .systemGray6
        
        return stackView
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 3
        
        return label
    }()
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = "September 21, 2021"
        
        return label
    }()
    
    // MARK: Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    private func setup() {
        // Setting the color of the cell
        self.backgroundColor = .systemGray6
        
        // MARK: View's Hierarchy
        self.contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(image)
        horizontalStackView.addArrangedSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(dateLabel)
        
        // MARK: Constraints
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            image.heightAnchor.constraint(equalTo: horizontalStackView.heightAnchor),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            verticalStackView.heightAnchor.constraint(equalTo: horizontalStackView.heightAnchor),
            titleLabel.heightAnchor.constraint(equalTo: horizontalStackView.heightAnchor, multiplier: 0.25),
            titleLabel.heightAnchor.constraint(equalTo: horizontalStackView.heightAnchor, multiplier: 0.75)
        ])
    }
}
