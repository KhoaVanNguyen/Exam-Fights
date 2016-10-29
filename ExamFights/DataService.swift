//
//  DataService.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USER = DB_BASE.child("Users")
    private var _REF_QUESTIONS = DB_BASE.child("Questions")
    private var _REF_QUESTION_TYPE = DB_BASE.child("QuestionType")
    private var _REF_EVENT = DB_BASE.child("Events")
    private var _REF_ROOMS = DB_BASE.child("Rooms")
    var REF_BASE : FIRDatabaseReference{
        return DB_BASE
    }
    var REF_USER : FIRDatabaseReference{
        return _REF_USER
    }
    
    var REF_QUESTIONS : FIRDatabaseReference{
        return _REF_QUESTIONS
    }
    var REF_QUESTION_TYPE : FIRDatabaseReference{
        return _REF_QUESTION_TYPE
    }
    var REF_EVENT : FIRDatabaseReference{
        return _REF_EVENT
    }
    var REF_ROOM : FIRDatabaseReference{
        return _REF_ROOMS
    }
    
    
}
