//
//  RoomVC.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class RoomVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var firstPlayerImg: CircleImage!
    var count = 300
    var timer = Timer()
    
    var answers = ["A","B","C","D"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(RoomVC.update), userInfo: nil, repeats: true)
    }
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return answers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as? AnswerCell{
            let question = Question(id: indexPath.row, quesitonImg: "", answers: answers, correctAnswer: 1)
            
            
            cell.configureCell(answerID: indexPath.row, question: question)
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
