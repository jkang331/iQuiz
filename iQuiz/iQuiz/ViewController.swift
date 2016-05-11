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
    
    var subjectsList: [String] = []
    var descriptionsList: [String] = []
    var questionsList: [String: NSArray] = [:]
    var imagePathList = ["mathematics.png", "marvel.jpg", "science.jpg"]
    var json : NSArray?
    
    private func retrieveSubjectsList() -> [String]{
        if(subjectsList.count == 0) {
            retrieveJSONData()
        }
        var counter = 0
        while (subjectsList.count == 0 && counter < 75) {
            sleep(2)
            counter = counter + 1
        }
        
        if(subjectsList.count == 0) {
            NSLog("wasn't able to fetch data - will prepopulate")
            subjectsList = ["Mathematics", "Marvel Super Heroes", "Science"]
            descriptionsList = ["description", "description", "description"]
        }
        return subjectsList
    }
    
    private func retrieveImagePath(subject:String) -> String {
        switch subject {
        case "Mathematics":
            return imagePathList[0]
        case "Marvel Super Heroes":
            return imagePathList[1]
        default:
            return imagePathList[2]
            
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let subjectTableIdentifier = "subject"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(subjectTableIdentifier) as! SubjectCell
        
        //Configuring the cell
        cell.title.text = retrieveSubjectsList()[indexPath.row]
        cell.descriptionLabel.text = descriptionsList[indexPath.row]
        let image = UIImage(named: retrieveImagePath(cell.title.text!) )
        cell.imageLeft.image = image
        
        
        
        //Adding a Separator Line to the Bottom
        let separatorLineView = UIView.init(frame: CGRectMake(0, cell.frame.size.height - 0.5 , self.view.frame.width, 1))
        separatorLineView.backgroundColor = UIColor.lightGrayColor()
        cell.addSubview(separatorLineView)
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return retrieveSubjectsList().count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0 //height for cell
    }
    
    
    // User wishes to go through quiz on given subject
    // Navigates user to the first question of the quiz
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let secondViewController = self.storyboard!.instantiateViewControllerWithIdentifier("question") as! QuestionController
        secondViewController.subject = retrieveSubjectsList()[indexPath.row]
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
    
    
    private func retrieveJSONData() {
        let URL = NSURL(string:"http://tednewardsandbox.site44.com/questions.json")
        let urlRequest = NSMutableURLRequest(URL:URL!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data,response, error) -> Void in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if statusCode == 200 {
                do{
                    
                    self.json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) as? NSArray
                    
                    var i = 0
                    repeat{
                        let subject:String = self.json![i]["title"] as! String
                        self.subjectsList.append(subject)
                        
                        let desc:String = self.json![i]["desc"] as! String
                        self.descriptionsList.append(desc)
                        
                        let questions = self.json![i]["questions"] as! NSArray
                        self.questionsList[subject] = questions
                        i+=1
                    } while i < self.json?.count
                    
                    print(self.questionsList)
                }catch {
                    print("Error with Json: \(error)")
                }
            }
        }
        task.resume()
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




