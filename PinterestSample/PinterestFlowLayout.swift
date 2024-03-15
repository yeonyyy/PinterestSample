//
//  PinterestFlowLayout.swift
//  PinterestSample
//
//  Created by rayeon lee on 2024/03/13.
//

import UIKit

/**
 CollectionViewLayoutAttributes.
 */

protocol PinterestFlowLayoutDelegate: AnyObject {
    func collectionView(collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat
}

class PinterestFlowLayout: UICollectionViewFlowLayout {
    weak var delegate: PinterestFlowLayoutDelegate?
    
    private var contentHeight: CGFloat = 0
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }

    override public func invalidateLayout() {
        cache.removeAll()
        contentHeight = 0
        
        super.invalidateLayout()
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    private var cache: [UICollectionViewLayoutAttributes] = []
    
    override func prepare() {
        guard let collectionView = collectionView, cache.isEmpty else { return }
        
        let numberOfColumns: Int = 2
        let cellPadding: CGFloat = 2
        let cellWidth: CGFloat = contentWidth / CGFloat(numberOfColumns)
        let contentWidth = cellWidth - (cellPadding * 2)
        
        let xOffSet: [CGFloat] = [0, cellWidth] // cell 의 x 위치를 나타내는 배열
        var yOffSet: [CGFloat] = .init(repeating: 0, count: numberOfColumns) // // cell 의 y 위치를 나타내는 배열
        
        var column: Int = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            // IndexPath 에 맞는 셀의 크기, 위치를 계산합니다.
            let indexPath = IndexPath(item: item, section: 0)
            let imageHeight = delegate?.collectionView(collectionView: collectionView, heightForImageAtIndexPath: indexPath, withWidth: contentWidth) ?? 180
            let annotationHeight = delegate?.collectionView(collectionView: collectionView, heightForAnnotationAtIndexPath: indexPath, withWidth: contentWidth) ?? 30
            let height = imageHeight + annotationHeight + (cellPadding * 2)
            
            let frame = CGRect(x: xOffSet[column],
                               y: yOffSet[column],
                               width: cellWidth,
                               height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffSet[column] = yOffSet[column] + height
            
            column = yOffSet[0] > yOffSet[1] ? 1 : 0
            
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect)
    -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath)
    -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
