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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if (  UserDefaults.standard.value(forKey: USER_ID) != nil  ){
            print("Load UID")
            performSegue(withIdentifier: "ChooseTopic", sender: nil)
        }
    }
    @IBAction func loginBtn(_ sender: Any) {
       
        if let email = emailTF.text, let password = passwordTF.text
            , email != "" , password != ""{
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (FIRUser, error) in
                if error != nil{
                    print("Login error: \(error) ")
                    if( (error as! NSError).code == STATUS_USER_NOTFOUND){
                    // user not found
                        print("User not found")
                    }
                    
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                            
                            print("User \(user) ")
                            print("error \(error) ")
                            
                            DataService.ds.createFirebaseUser(userID: (user?.uid)!, userData: [
                                "username" : email,
                                "online" : "ON",
                                "avatar_url" : DEFAULT_AVATAR,
                                "display_name" : email ]
                                                              
                                )
                            
                            UserDefaults.standard.setValue(user?.uid, forKey: USER_ID)
                            print("Save UID: \(UserDefaults.standard.value(forKey: USER_ID))")
                            self.performSegue(withIdentifier: "ChooseTopic", sender: nil)
                            
                            
                        })
                    })
                
                }
                    else{
                    // perform segue
                    print("Login successfully!")
                    UserDefaults.standard.setValue(FIRUser?.uid, forKey: USER_ID)
                    self.performSegue(withIdentifier: "ChooseTopic", sender: nil)
                    
                }
                
            })
            
        }
        
    }

   

}

