//
//  AnswerCell.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    @IBOutlet weak var answerIDLbl: UILabel!
    
    @IBOutlet weak var answerImage: UIImageView!
    
    
    
    func configureCell( correctAnswer : Int,  answer : String ){
        var questionLetter = "A"
        switch correctAnswer {
        case 0:
            questionLetter = "A"
        case 1:
            questionLetter = "B"
        case 2:
            questionLetter = "C"
        case 3:
            questionLetter = "D"
        default:
            questionLetter = "A"
        }
        answerIDLbl.text = answer
      // answerImage.image = UIImage(named: answer)
    }
    func showImage( imgUrl : String ){
        
        answerImage.image = UIImage(named: imgUrl)
        
    }
}
