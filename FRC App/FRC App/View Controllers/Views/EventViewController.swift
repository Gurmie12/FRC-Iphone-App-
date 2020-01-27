//
//  EventViewController.swift
//  FRC App
//
//  Created by Gurman Brar on 2020-01-27.
//  Copyright © 2020 Gurman Brar. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        events = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func createArray() -> [Event] {
        
        var tempEvents: [Event] = []
        
        let event1 = Event(image: #imageLiteral(resourceName: "Ryerson") , title: "Ryerson (March 13-14 2020)")
        let event2 = Event(image: #imageLiteral(resourceName: "McMaster"), title: "McMaster (April 3-5 2020)")
        
        tempEvents.append(event1)
        tempEvents.append(event2)
        
        return tempEvents
        
    }
    

}


extension EventViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = events[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventCell
        
        cell.setVideo(event: event)
        
        return cell
    }
}
