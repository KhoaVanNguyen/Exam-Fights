//
//  ChooseTopicVC.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class ChooseTopicVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let topicImages = ["math","english","physics","chemistry"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topicImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicCell", for: indexPath) as? TopicCell{
            cell.configureCell(imgName: topicImages[indexPath.row])
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
}

