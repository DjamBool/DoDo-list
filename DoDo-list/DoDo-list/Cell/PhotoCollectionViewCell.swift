
//  Created by Игорь Мунгалов on 09.04.2025.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "PhotoCollectionCell"
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "hala")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jalapeño"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "79р"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ element: IngredientModel) {
        photoImageView.image =  UIImage(named: element.image)
        nameLabel.text = element.name
        priceLabel.text = element.price
    }
    
    func setupViews() {
        contentView.addSubview(containerView)
        [photoImageView, nameLabel, priceLabel].forEach { containerView.addSubview($0) }
        [photoImageView, nameLabel, priceLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false}
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: -10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            containerView.heightAnchor.constraint(equalToConstant: 250),
            
            photoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            photoImageView.heightAnchor.constraint(equalToConstant: 90),
            photoImageView.widthAnchor.constraint(equalToConstant: 110),
            photoImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
}
