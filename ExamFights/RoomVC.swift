//
//  RoomVC.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import Firebase
class RoomVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var firstPlayerImg: CircleImage!
    var count = 300
    var timer = Timer()
    
    
    var tempImages = ["A","B","C","D"]
    
    var currentQuestion = 0
    var answers = [String]()
    var listQuesiton = [Question]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(RoomVC.update), userInfo: nil, repeats: true)
        
        DataService.ds.REF_QUESTIONS.observe(.value, with: { snapshot in
            
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    
                    let postKey = snap.key
                    
                    if let snap = snap.value as? Dictionary<String, Any>{
                        let question = Question(key: postKey, questionData: snap)
                        
                        self.listQuesiton.append(question)
                        
                        DataService.ds.listQuestion.append(question)
                        self.answers = question.answers
                        print(question.correctAnser)
                    }
                }
                self.collectionView.reloadData()
                
                
            }
        })

    
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as? AnswerCell {
//            let tempAnswer = DataService.ds.listQuestion[currentQuestion].answers
           answers = DataService.ds.listQuestion[currentQuestion].answers
            print(answers)
            cell.configureCell(correctAnswer: 1, answer: answers[indexPath.row]  )
            
          
            //  cell.showImage(imgUrl: tempImages[indexPath.row])
            return cell
        }
        else {
            return AnswerCell()
        }
    }
 
    
    // function
    func update() {
        if(count > 0){
            UIView.animate(withDuration: 1.0, animations: {
                if ( self.count % 2 == 0 ){
                    self.firstPlayerImg.alpha = 0
                }else{
                    self.firstPlayerImg.alpha = 1
                }
            })
            count -= 1
        }
    }
}
