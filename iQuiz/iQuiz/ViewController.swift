//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/1/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var SubjectTableView: UITableView!
    
    var subjectsList = ["Mathematics", "Marvel Super Heroes", "Science"]
    var imagePathList = ["math.png", "avengers-age-of-ultron.jpg", "science.jpg"]
    var json : AnyObject?
    
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

    
    // User wishes to go through quiz on given subject
    // Navigates user to the first question of the quiz
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("question") as! QuestionController
        secondViewController.subject = subjectsList[indexPath.row]
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func alert(sender: UIBarButtonItem) {
        let alertController = UIAlertController.init(title: "Settings", message: "Settings Go Here", preferredStyle: .Alert)
        let okAction = UIAlertAction(title:"OK", style:.Default) {(action) in };
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true) { 
            NSLog("Pressed Ok and Settings Alert")
        }
        
    }
    
    
    func retrieveJSONData() {
        let url_String = "http://tednewardsandbox.site44.com/questions.json";
        let data = NSData(contentsOfURL: NSURL(string: url_String)!)
//        var error : NSError
        
//        var error:NSError? = nil
//        if let jsonObject: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:&error) {
//            if let dict = jsonObject as? NSDictionary {
//                NSLog(dict)
//            } else {
//                NSLog("not a dictionary")
//            }
//        } else {
//            NSLog("Could not parse JSON: \(error!)")
//        }
        

        do {
            if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as?NSDictionary {
                NSLog("hooray")
                NSLog(jsonResult.descriptionInStringsFileFormat)
                print(jsonResult)
            }
        } catch let error as NSError {
            NSLog(":(")
            print(error.localizedDescription)
        }
        
//        json = NSJSONSerialization.JSONObjectWithData(data!, options: nil) throws -> error
//        
//        if (json) {
//            NSLog("Error parsing JSON: \(error)");
//        } else {
//            for _ in json {
//                NSLog(@"Item: %@", item);
//            }
//        }
        
        
    }
    
    override func viewDidLoad() {
        retrieveJSONData()
        super.viewDidLoad()
        self.SubjectTableView.delegate = self
        self.SubjectTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
