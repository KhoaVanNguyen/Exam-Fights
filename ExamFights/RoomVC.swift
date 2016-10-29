//
//  RoomVC.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class RoomVC: UIViewController {
    @IBOutlet weak var firstPlayerImg: CircleImage!
    var count = 300
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(RoomVC.update), userInfo: nil, repeats: true)
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }

    func update() {
        
        if(count > 0){
            
            UIView.animate(withDuration: 1.0, animations: {
                if ( self.count % 2 == 0 ){
                    self.firstPlayerImg.alpha = 0
                }else{
                    self.firstPlayerImg.alpha = 1
                }
                
            })
            count -= 1
         
        }
        
    }
   

   

}
