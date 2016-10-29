//
//  Room.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation

class Room  {
    
    private var _roomKey : String
    private var _questions : [String]
    private var _team1 : [String]
    private var _team2 : [String]
    var roomKey : String{
        return _roomKey
    }
    var question : [String]{
        return _questions
    }
    var team1 : [String]{
        return _team1
    }
    var team2 : [String]{
        return _team2
    }

    
    init(roomKey : String, roomDict : Dictionary<String, Any>) {
//        if let listQuestion = roomDict["questions"] as? Dictionary<String,Any>{
//            for question in listQuestion{
//                if let quesitonId =
//            }
//        }
//        
    
      
        let team1 = roomDict["team1"] as! [String]
        let team2 = roomDict["team1"] as! [String]
        
        self._roomKey = roomKey
        self._questions = [""]
        self._team1 = team1
        self._team2 = team2
    }
    
    
    
    
}
