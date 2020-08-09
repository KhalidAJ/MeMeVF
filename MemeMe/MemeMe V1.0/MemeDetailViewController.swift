//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Khalid Ajlan on 10/14/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    var meme: Meme!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var imageView: UIImageView!
   
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.imageView!.image = meme.memeImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

}
