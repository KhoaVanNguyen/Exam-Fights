//
//  AnswerCell.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import Firebase
class AnswerCell: UITableViewCell {
 
    
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var answerImage: UIImageView!
    
    
    
    func configureCell( correctAnswer : Int,  answer : String ){
        let ref = FIRStorage.storage().reference(forURL: answer)
        ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
            if error != nil {
                print("Download image error")
            } else {
                if let imgData = data {
                    if let img = UIImage(data: imgData) {
                        self.answerImage.image = img
                    }
                }
            }
        })
    }
 
    
    func showImage( imgUrl : String ){
        
        answerImage.image = UIImage(named: imgUrl)
        
    }
    func showCheckImage(){
        checkImg.isHidden = false
    }
}
