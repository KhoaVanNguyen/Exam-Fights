//
//  ViewController.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit
import Firebase
class LoginVC: UIViewController {

    @IBOutlet weak var passwordTF: CustomTF!
    @IBOutlet weak var emailTF: CustomTF!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginBtn(_ sender: Any) {
       
        if let email = emailTF.text, let password = passwordTF.text
            , email != "" , password != ""{
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (FIRUser, error) in
                if error != nil{
                    print("Login error")
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (newUser, error) in
                        print("Create user successfully!")
                    })
                }else{
                    // perform segue
                    
                    print("Login successfully!")
                    
                }
                
            })
            
        }
        
        
        
        
        
    }

   

}

