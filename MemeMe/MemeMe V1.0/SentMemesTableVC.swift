//
//  SentMemesTableVC.swift
//  MemeMe
//
//  Created by Khalid Ajlan on 10/14/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit

class SentMemesTableVC : UITableViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          tableView.reloadData()
          //Set Navigation Controller & Tab Bar Controller Hidden Properties
      }
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    override func tableView(_ collectionView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Grab the DetailVC from Storyboard
           let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController

           //Populate view controller with data from the selected item
           detailController.meme = memes[(indexPath as NSIndexPath).row]

           // Present the view controller using navigation
           navigationController!.pushViewController(detailController, animated: true)

    }
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MemedCell
        cell.memedImage.image =  memes[indexPath.row].memeImage
        cell.memedText.text = memes[indexPath.row].Top + " ... " + memes[indexPath.row].Bottom
         return cell
    }
    @IBAction func addMeme(_ sender: Any) {
        let memeEditorVC = storyboard?.instantiateViewController(withIdentifier: "CreateMemeViewController") as! CreateMemeViewController
        navigationController?.pushViewController(memeEditorVC, animated: true)
    }
}
