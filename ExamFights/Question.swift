//
//  Question.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation


class Question{
    
    var quesitonID : Int!
    
    var answers : [String]
    
    var correctAnser : Int!
    
    var questionImage : String
    
    var type : Int!
    
    init(id : Int, quesitonImg : String, answers: [String] , correctAnswer : Int) {
        self.quesitonID = id
        self.questionImage = quesitonImg
        self.answers = answers
        self.correctAnser = correctAnswer
    }
    
}
