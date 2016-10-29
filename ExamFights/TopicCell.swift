//
//  TopicCell.swift
//  ExamFights
//
//  Created by Khoa on 10/29/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

class TopicCell: UICollectionViewCell {
    @IBOutlet weak var topicImage: UIImageView!
    
    
    
    func configureCell(imgName : String){
        topicImage.image = UIImage(named: imgName)
    }
}
