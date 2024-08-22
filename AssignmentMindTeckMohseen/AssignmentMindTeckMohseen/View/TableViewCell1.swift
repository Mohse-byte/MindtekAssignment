//
//  TableViewCell.swift
//  AssignmentMindTeckMohseen
//
//  Created by Mohseen Shaikh on 21/08/24.
//

import UIKit

class TableViewCell1: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var items: [String] = ["flower","natures","swiftBird","car"] // Data source for the collection view
    var selectedIndex = 0
    var callback:((Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

// MARK: - UICollectionView DataSource and Delegate
extension TableViewCell1: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        // Configure your cell (e.g., set labels, images)
        cell.carouselImg.image = UIImage(named: items[indexPath.row])
        return cell
    }
    // Swipe Gesture Recognizer for Collection View
      func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
          let selectedCell = collectionView.cellForItem(at: indexPath)
           selectedIndex = indexPath.item
          callback?(selectedIndex)

          // Use the selectedIndex as needed
      }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // For some reason he chose the measures of collectionViewCell and substracted 2
        print("INSIDE TableViewCell2.collectionView ")
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}
