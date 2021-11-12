//
//  CryptoTableViewCell.swift
//  CryptoTracker
//
//  Created by Evandro Rodrigo Minamoto on 04/11/21.
//

import UIKit

final class CryptoTableViewCell: UITableViewCell {
    static var indentifier: String {
        String(describing: self)
    }
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let symbolLabel: UILabel = {
       let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .systemGray2
       
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .systemGreen
        label.textAlignment = .right
        
        return label
    }()
    
    private let imageViewLogo: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        return imageView
    }()
    
    
    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, symbolLabel])
        stack.axis = .vertical
        stack.spacing = 8
        let containerStack = UIStackView(arrangedSubviews: [stack, priceLabel ])
        containerStack.spacing = 4
        return containerStack
    }()
    
    private lazy var containerStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [imageViewLogo, labelsStackView ])
        stack.spacing = 20
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clear()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clear(){
        nameLabel.text = nil
        symbolLabel.text = nil
        priceLabel.text = nil
    }
    
    func configure(with model: CryptoCellModel){
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
        priceLabel.text = model.price
        
//        guard let url = URL(string: model.imageString ?? "")
    }
   
}
extension CryptoTableViewCell: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStack)
    }
    
    func addConstraints() {
        imageViewLogo.constrainWidth(60)
        containerStack.fillSuperview(padding: UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18))
    }
    
    func additionalConfiguration() {}
    
    
    
}
