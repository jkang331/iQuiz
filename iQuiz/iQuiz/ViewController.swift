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
    
    var subjectsList = ["Mathematics", "Marvel Super Heroes", "Science"]
    var imagePathList = ["math.jpg", "avengers-age-of-ultron.jpg", "science.jpg"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let subjectTableIdentifier = "subject"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(subjectTableIdentifier) as! SubjectCell
        
        //Configuring the cell
        let image = UIImage(named: imagePathList[indexPath.row])
        cell.imageLeft.image = image
        cell.descriptionLabel.text = "Subject Description Sentence Here"
        cell.title.text = subjectsList[indexPath.row]
        
        //Adding a Separator Line to the Bottom
        let separatorLineView = UIView.init(frame: CGRectMake(0, cell.frame.size.height - 0.5 , self.view.frame.width, 1))
        separatorLineView.backgroundColor = UIColor.lightGrayColor()
        cell.addSubview(separatorLineView)
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectsList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0 //height for cell
    }
    
    @IBAction func alert(sender: UIBarButtonItem) {
        let alertController = UIAlertController.init(title: "Settings", message: "Settings Go Here", preferredStyle: .Alert)
        let okAction = UIAlertAction(title:"OK", style:.Default) {(action) in };
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true) { 
            NSLog("Pressed Ok and Settings Alert")
        }
        
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
