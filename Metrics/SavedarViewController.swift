//
//  SavedarViewController.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 05/03/23.
//

import UIKit

class SavedarViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
    }

}

extension SavedarViewController:
    UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedarCollectionViewCell", for: indexPath) as! SavedarCollectionViewCell
            cell.setup(with: data[indexPath.row])
            return cell
        }
    }



