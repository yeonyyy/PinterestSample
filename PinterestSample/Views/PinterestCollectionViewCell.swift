//
//  CollectionViewCell.swift
//  PinterestSample
//
//  Created by rayeon lee on 2024/03/11.
//

import UIKit

class PinterestCollectionViewCell: UICollectionViewCell {
    static let id = "PinterestCollectionViewCell"
    
    private var _containerView : UIView?
    public var containerView : UIView {
        get {
            if let containerView = _containerView {
                return containerView
            }
            let containerView = UIView()
            _containerView = containerView
            
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = .white
            
            contentView.addSubview(containerView)
            
            NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
                containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            ])
            
            return containerView
        }
    }
    
    private var _imageView : UIImageView?
    public var imageView : UIImageView {
        get {
            if let imageView = _imageView {
                return imageView
            }
            let imageView = UIImageView(frame: containerView.bounds)
            _imageView = imageView
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.setupLayoutsForImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
            
            return imageView
        }
    }
    
    private var _titleLabel : UILabel?
    public var titleLabel : UILabel {
        get {
            if let label = _titleLabel {
                return label
            }
            let label = UILabel()
            _titleLabel = label
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = UIFont(name: "Helvetica", size: 16.0)
            
            self.setupLayoutsForLabel()
            
            return label
        }
    }
    
    private func setupLayoutsForImageView() {
        containerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
        ])
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    private func setupLayoutsForLabel() {
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
}
