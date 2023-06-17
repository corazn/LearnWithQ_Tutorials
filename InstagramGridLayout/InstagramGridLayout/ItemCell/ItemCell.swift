//
//  ItemCell.swift
//  InstagramGridLayout
//
//  Created by QuyetBH on 17/06/2023.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func displayImage() {
        self.imageView.image = nil
        DataManager.shared.fetchRandomImage { [weak self] data in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.imageView.image = UIImage(data: data ?? Data())
            }
        }
    }
    
}

