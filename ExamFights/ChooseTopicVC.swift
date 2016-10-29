//
//  ChooseTopicVC.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class ChooseTopicVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var isClicked = false
    let topicImages = ["math","english","physics","chemistry","history","geography"]
    var user_topics = [String]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        
//        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
//            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
//                for snap in snapshot {
//                    print("SNAP: \(snap)")
//                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
//                        let key = snap.key
//                        let post = Post(postKey: key, postData: postDict)
//                        self.posts.append(post)
//                    }
//                }
//            }
//            self.tableView.reloadData()
        
        

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
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! TopicCell
//        cell.hiddenImage()
//        user_topics.remove(at: indexPath.row)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // CHECK LATER
      
        let cell = collectionView.cellForItem(at: indexPath) as! TopicCell
        cell.showCheckImage()
        user_topics.append(topicImages[indexPath.row])
     
        
    }
  
    @IBAction func nextBtn(_ sender: Any) {
        let currentID = UserDefaults.standard.value(forKey: USER_ID)
        for i in 0..<user_topics.count{
            let q = QuestionType(id: i, name: user_topics[i])
            DataService.ds.addUserTopic(questionType: q, data: [ "\(currentID!)" : true  ])
        }
    }
}

