//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/1/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var SubjectTableView: UITableView!
    @IBOutlet weak var subjectCell: UITableViewCell!
    
    var subjectsList = ["Mathematics", "Marvel Super Heroes", "Science"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let subjectTableIdentifier = "subject"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(subjectTableIdentifier)
        
        if (cell == nil) {
            cell = UITableViewCell.init()
        }
        
        cell!.textLabel!.text = subjectsList[indexPath.row]
        return cell!;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectsList.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.SubjectTableView.delegate = self
        self.SubjectTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
