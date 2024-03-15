//
//  ViewController.swift
//  PinterestSample
//
//  Created by rayeon lee on 2024/03/11.
//

import UIKit

class PinterestViewController: UIViewController {
    
    private lazy var collectionView : UICollectionView = {
        let layout = PinterestFlowLayout()
        layout.delegate = self
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(PinterestCollectionViewCell.self, forCellWithReuseIdentifier: PinterestCollectionViewCell.id)
        return collectionView
        
    }()
    
    private let photos = Photo.getPhotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        self.navigationItem.title = "Pinterest"
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension PinterestViewController : PinterestFlowLayoutDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinterestCollectionViewCell.id, for: indexPath) as? PinterestCollectionViewCell else {
            return UICollectionViewCell()
        }
        let photo = photos[indexPath.item]
        cell.imageView.image = UIImage(named: photo.name)
        cell.titleLabel.text = photo.title
        cell.layoutIfNeeded()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        let photo = photos[indexPath.item]
        guard let image = UIImage(named: photo.name) else {
            return 0.0
        }
        let ratio = image.size.height / image.size.width
        let newHeight = withWidth * ratio
        
        return newHeight
    }
    
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        let photo = photos[indexPath.item]
        let textHeight = requiredHeight(text: photo.title, cellWidth: (withWidth - 10))
        return textHeight
    }
    
    func requiredHeight(text:String , cellWidth : CGFloat) -> CGFloat {
        let font = UIFont(name: "Helvetica", size: 16.0)
        let label : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: cellWidth, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
        
    }
    
}
