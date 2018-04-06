//
//  DashboardCollectionViewController.swift
//  in4me
//
//  Created by Maximilian Klinke on 06.04.18.
//  Copyright © 2018 Maximilian Klinke. All rights reserved.
//

import Foundation
import UIKit

class DashboardCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var collectionViewItems = [" Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "Blub", "Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "Play around, add as many UI elements as you want. Try to re-create any application’s views that you see challenging. Start simple and build up from there. Try to draw the UI components on a piece of paper so you can imagine how they fit together."]
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionViewItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TextMessageCell", for: indexPath) as! TextMessageCell
        
        print(self.collectionViewItems[indexPath.row])
        
        let text = self.collectionViewItems[indexPath.row]
        cell.labelMessage.text = text
        
        cell.viewMessageBackground.layer.masksToBounds = true
        cell.viewMessageBackground.layer.cornerRadius = LayoutConstants.CORNER_RADIUS
        
        
        
        
        cell.layoutSubviews()
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        /*
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            print("Is flow layout")
            flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize //CGSize(width: 1, height: 1) //CGSizeMake(1, 1) use auto layout for the collection view
            
        }*/
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /*
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            print("Is flow layout")
            flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize //CGSize(width: 1, height: 1) //CGSizeMake(1, 1) use auto layout for the collection view
            
        }*/
        
        print(UICollectionViewFlowLayoutAutomaticSize.height)
        
        //return CGSize(width: 100.0, height: UICollectionViewFlowLayoutAutomaticSize.height)
        let collectionViewWidth = self.collectionView.layer.bounds.width
        let labelWidth = collectionViewWidth-8-8-8-40-8-8
        
        print("Width: ", labelWidth)
        
        var collectionViewHeight = self.collectionViewItems[indexPath.row].height(withConstrainedWidth: labelWidth, font: UIFont.systemFont(ofSize: 17)) + 8 + 8 + 8 + 8
        
        
        //ELSE:
        var minHeight = CGFloat(40)
        minHeight = minHeight + 12 + 8 + 8
        if collectionViewHeight < minHeight {
            collectionViewHeight = minHeight
        }
        
        return CGSize(width: collectionViewWidth, height: collectionViewHeight)
    }
    
}
