//
//  InstagramGridLayout.swift
//  InstagramGridLayout
//
//  Created by QuyetBH on 17/06/2023.
//

import UIKit

class InstagramGridLayout: UICollectionViewLayout {
    
    private var contentHeight: CGFloat = 0
    
    private var contentWidth: CGFloat {
        guard let collectionView = self.collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    private var calculatedAttributes = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        guard let collectionView = self.collectionView else {
            return
        }
        let itemWidth = self.contentWidth / 3
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexInsideGroup = item % 10
            
            let x: CGFloat = {
                switch indexInsideGroup {
                case 0, 2, 5:
                    return 0
                case 1, 3, 6, 8:
                    return itemWidth
                default:
                    return itemWidth * 2
                }
            }()
            let y: CGFloat = {
                let numberOfAboveGroups = item / 10
                let groupHeight = itemWidth * 4
                let aboveGroupsHeight = CGFloat(numberOfAboveGroups) * groupHeight
                
                let yOffsetInsideGroup: CGFloat = {
                    switch indexInsideGroup {
                    case 0, 1, 4:
                        return 0
                    case 2, 3:
                        return itemWidth
                    case 5, 6, 7:
                        return itemWidth * 2
                    default:
                        return itemWidth * 3
                    }
                }()
                
                return aboveGroupsHeight + yOffsetInsideGroup
            }()
            let height: CGFloat = {
                switch indexInsideGroup {
                case 4, 5:
                    return itemWidth * 2
                default:
                    return itemWidth
                }
            }()
            let width = itemWidth
            
            let frame = CGRect(x: x, y: y, width: width, height: height)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: item, section: 0))
            attributes.frame = frame
            calculatedAttributes.append(attributes)
            
            self.contentHeight = max(self.contentHeight, frame.maxY)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.calculatedAttributes.filter({ $0.frame.intersects(rect) })
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.calculatedAttributes[indexPath.item]
    }
    
}
