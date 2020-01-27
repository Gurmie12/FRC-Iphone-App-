//
//  EventCell.swift
//  FRC App
//
//  Created by Gurman Brar on 2020-01-27.
//  Copyright © 2020 Gurman Brar. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

 
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var eventNameLabel: UILabel!
    
    func setVideo(event: Event){
        eventImageView.image = event.image
        eventNameLabel.text = event.title
    }
    
    
}
