//
//  ViewController.swift
//  InstagramGridLayout
//
//  Created by QuyetBH on 17/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.collectionViewLayout = InstagramGridLayout()
        self.collectionView.register(UINib(nibName:"ItemCell", bundle: nil),
                                     forCellWithReuseIdentifier: "ItemCell")
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.displayImage()
        return cell
    }
    
}
