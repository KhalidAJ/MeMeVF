//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Khalid Ajlan on 10/14/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController{
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        let space:CGFloat = 3.0
           let dimension = (view.frame.size.width - (2 * space)) / 3.0

           flowLayout.minimumInteritemSpacing = space
           flowLayout.minimumLineSpacing = space
           flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          collectionView.reloadData()
          //Set Navigation Controller & Tab Bar Controller Hidden Properties
          navigationController?.isNavigationBarHidden = false
          tabBarController?.tabBar.isHidden = false
      }
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          NotificationCenter.default.removeObserver(self)
      }
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Grab the DetailVC from Storyboard
           let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController

           //Populate view controller with data from the selected item
         detailController.meme = memes[(indexPath as NSIndexPath).row]

           // Present the view controller using navigation
           navigationController!.pushViewController(detailController, animated: true)

    }
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.memedImage.image = memes[indexPath.row].memeImage
        return cell
    }

}
