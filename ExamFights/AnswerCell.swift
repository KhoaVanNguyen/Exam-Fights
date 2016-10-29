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
    
    
    
    func configureCell( answerID : Int,  question : Question ){
        var questionLetter = "A"
        switch question.quesitonID {
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
        answerIDLbl.text = questionLetter
        answerImage.image = UIImage(named: question.answers[answerID])
    }
}
