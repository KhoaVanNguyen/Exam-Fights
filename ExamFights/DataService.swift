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
let STORAGE_BASE = FIRStorage.storage().reference()
class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("Users")
    private var _REF_QUESTIONS = DB_BASE.child("Questions")
    private var _REF_QUESTION_TYPE = DB_BASE.child("QuestionType")
    private var _REF_EVENT = DB_BASE.child("Events")
    private var _REF_ROOMS = DB_BASE.child("Rooms")
    
    private var _REF_QUESTION_IMAGES = STORAGE_BASE.child("Questions").child("question01")
    
    
    private var REF_QUESTION_IMAGE : FIRStorageReference{
        return _REF_QUESTION_IMAGES
    }
    private var _listQuestion = [Question]()
    
    var listQuestion : [Question]{
        get{
            return _listQuestion
        }
        set{
            _listQuestion = newValue
        }
    }
    var REF_BASE : FIRDatabaseReference{
        return DB_BASE
    }
    var REF_USERS : FIRDatabaseReference{
        return _REF_USERS
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
    
    var REF_USER_CURRENT: FIRDatabaseReference {
        let uid = UserDefaults.standard.value(forKey: USER_ID)
        let user = REF_USERS.child(uid! as! String)
        return user
    }
    
    
    func createFirebaseUser( userID : String, userData : Dictionary<String, Any> ){
        _REF_USERS.child(userID).setValue(userData)
    }
    
    func addUserTopic( questionType : QuestionType, data : Dictionary<String, Any> )
    {
        _REF_QUESTION_TYPE.child("\(questionType.name)").child("users").child("\(UserDefaults.standard.value(forKey: USER_ID)!)").setValue(data)
    }
    
    
}
