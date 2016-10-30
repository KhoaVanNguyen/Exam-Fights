//
//  RoomVC.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import Firebase
class RoomVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var roundLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fifthPlayerImg: CircleImage!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var firstPlayerImg: CircleImage!
    var count = 30
    var round = 0;
    var timer = Timer()
    
    
//    var tempImages = ["A","B","C","D"]
    var isNextRound = false
    var currentQuestion = 0
    var answers = [String]()
    var activeQuestion = ""
    var listQuesiton = [Question]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(RoomVC.update), userInfo: nil, repeats: true)
        
//        DataService.ds.REF_QUESTIONS.observe(.value, with: { snapshot in
//            
//            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
//                for snap in snapshot {
//                    
//                    let postKey = snap.key
//                    
//                    if let snap = snap.value as? Dictionary<String, Any>{
//                        let question = Question(key: postKey, questionData: snap)
//                        
//                        self.listQuesiton.append(question)
//                        
//                        DataService.ds.listQuestion.append(question)
//                        self.answers = question.answers
//                    }
//                }
//                self.collectionView.reloadData()
//                
//            }
//        })

        /// Room:
        
        DataService.ds.REF_ROOM.child("roomid").child("active_question").observe(.value, with: {
            snapshot in
            
            if let active_question = snapshot.value{
                
                DataService.ds.REF_QUESTIONS.child("\(active_question)").observeSingleEvent(of: .value, with: {
                    snapshot in
                    if let questionData = snapshot.value as? Dictionary<String,Any>{
                        let questionKey = snapshot.key
                        let question = Question(key: questionKey, questionData: questionData)
                        self.activeQuestion = questionKey
                        self.listQuesiton.append(question)
                        
                        DataService.ds.listQuestion.append(question)
                        self.answers = question.answers
                        
                        self.changeQuestionImage(imageUrl: question.questionImage)
                        
                        self.round += 1
                        
                        self.roundLbl.text = "\(self.round)"
                        self.isNextRound = true
                        print(self.answers)
                    }
                    self.tableView.reloadData()
                    }
                )
                
            }
            
        })
        DataService.ds.REF_ROOM.child("roomid").child("end_game").observe(.value, with: {
            snapshot in
                print("end_Game \(snapshot.value)")
            if let snap = snapshot.value as? Int{
                if  ( snap == 1 ){
                    self.performSegue(withIdentifier: "ExplainVC", sender: nil)
                }
            }
                
            })
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as? AnswerCell {
            //            let tempAnswer = DataService.ds.listQuestion[currentQuestion].answers
            
            cell.configureCell(correctAnswer: 1, answer: answers[indexPath.row]  )
            cell.checkImg.isHidden = true
            return cell
        }
        else {
            return AnswerCell()
        }

    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AnswerCell{
           
                cell.checkImg.isHidden = true
     
           
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AnswerCell{
          
                cell.checkImg.isHidden = false
            
         
            
        
            DataService.ds.REF_ROOM.child("roomid").child("questions").child(activeQuestion).child("\(UserDefaults.standard.value(forKey: USER_ID)!)").setValue(indexPath.row)
        }
    }
    
    // function
    func update() {
        if(count > 0){
            UIView.animate(withDuration: 1.0, animations: {
                if ( self.count % 2 == 0 ){
                    self.firstPlayerImg.alpha = 0
                    self.fifthPlayerImg.alpha = 0
                }else{
                    self.firstPlayerImg.alpha = 1
                    self.fifthPlayerImg.alpha = 1
                }
            })
            count -= 1
        }
    }
    func changeQuestionImage( imageUrl : String ){
        let ref = FIRStorage.storage().reference(forURL: imageUrl)
        ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
            if error != nil {
                print("Download image error")
            } else {
                if let imgData = data {
                    if let img = UIImage(data: imgData) {
                        self.questionImage.image = img
                    }
                }
            }
        })

    }
}
