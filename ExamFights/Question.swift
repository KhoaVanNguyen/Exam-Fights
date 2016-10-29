//
//  Question.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation


class Question{
    
    var quesitonKey : String!
    
    var answers : [String]
    
    var correctAnser : Int!
    
    var questionImage : String!
    
    var type : Int!
    
    init(key : String, quesitonImg : String, answers: [String] , correctAnswer : Int, type : Int) {
        self.quesitonKey = key
        self.questionImage = quesitonImg
        self.answers = answers
        self.correctAnser = correctAnswer
        self.type = type
    }
    init(key : String, questionData : Dictionary<String, Any>) {
        var listAnswer = [String]()
        
        let correct_answer = questionData["correct_answer"]
        
    
        

        let questionImg = questionData["question_image"]

   
        let type = questionData["type"]

            
        if let answerArr = questionData["answers"] as? [String]{
            for answer in answerArr{
                    listAnswer.append(answer)
                }
            self.answers = listAnswer
            }
        
        self.quesitonKey = key
        self.correctAnser = correct_answer as! Int!
        self.questionImage = questionImg as! String!
        self.type = type as! Int!
        self.answers = listAnswer
        
        self.quesitonKey = key
    }

    
}
