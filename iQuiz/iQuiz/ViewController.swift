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
    var questionsList: [String: String] = [:]
    var imagePathList = ["mathematics.png", "marvel.jpg", "science.jpg"]
    var json : NSArray?
    var forceRefresh = false
    var JSONPath = "http://tednewardsandbox.site44.com/questions.json"
    
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
            // SHOULDN'T EVER REACH HERE
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
        secondViewController.questionsList = questionsList[secondViewController.subject!]
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func alert(sender: UIBarButtonItem) {
        let alertController = UIAlertController.init(title: "Settings", message: "Change JSON file", preferredStyle: .Alert)
        let updateAction = UIAlertAction(title:"Update", style:.Default, handler: {
            alert -> Void in
            NSLog("hi")
            self.JSONPath = alertController.textFields![0].text!
            self.forceRefresh = true
            self.retrieveJSONData()
            self.setNeedsFocusUpdate()
        });
        alertController.addAction(updateAction)
        let cancelAction = UIAlertAction(title:"Cancel", style:.Default) {(action) in };
        alertController.addAction(cancelAction)
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.text = "http://"
        }
        self.presentViewController(alertController, animated: true) {
            NSLog("Pressed Ok and Settings Alert")
        }
        
    }
    
    
    private func retrieveJSONData() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let jsonFile = defaults.objectForKey("json")
        
        if(jsonFile == nil || forceRefresh) {
            let URL = NSURL(string:JSONPath)
            let urlRequest = NSMutableURLRequest(URL:URL!)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(urlRequest) { (data,response, error) -> Void in
                
                let httpResponse : NSHTTPURLResponse
                if response != nil {
                    httpResponse = response as! NSHTTPURLResponse
                    let statusCode = httpResponse.statusCode
                    
                    if statusCode == 200 {
                        do{
                            
                            self.json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments) as? NSArray
                            
                            // locally store json file
                            
                            defaults.setObject(self.json, forKey: "json")
                            
                            self.parseJson(self.json!)
                            
                            
                        }catch {
                            print("Error with Json: \(error)")
                        }
                    }
                } else { // original URL didn't work reverting to backup stored JSON file
                    self.retrieveBackupJSONFile()
                }
                
            }
            task.resume()

        } else {
            self.parseJson(jsonFile! as! NSArray)
        }
    }

    
    private func retrieveBackupJSONFile(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let filePath = NSBundle.mainBundle().pathForResource("backup", ofType: "json")
        let contentsOfLocalFile = NSData.init(contentsOfFile: filePath!)
        do{
            
            self.json = try NSJSONSerialization.JSONObjectWithData(contentsOfLocalFile!, options: .AllowFragments) as? NSArray
            
            // locally store json file
            
            defaults.setObject(self.json, forKey: "json")
            self.parseJson(self.json!)
            
            
        }catch {
            print("Error with Json: retrieving local json file")
        }
        
    }

    
    private func parseJson(jsonFile : NSArray) {
        var i = 0
        repeat{
            let subject:String = jsonFile[i]["title"] as! String
            self.subjectsList.append(subject)
            
            let desc:String = jsonFile[i]["desc"] as! String
            self.descriptionsList.append(desc)
            
            var questionCounter = 0
            
            let totalNumberQuestions = jsonFile[i]["questions"]!!.count
            var stringify = ""
            while questionCounter <  totalNumberQuestions {
                
                let question = jsonFile[i]["questions"]!![questionCounter]["text"]!
                
                let answer = jsonFile[i]["questions"]!![questionCounter]["answer"]!
                
                let options = jsonFile[i]["questions"]!![questionCounter]["answers"]!?.componentsJoinedByString("|")
                
                stringify = stringify + "~~~\(question!)~~~\(options!)~~~\(answer!)###" //~~~\(questionCounter)
                questionCounter += 1
            }
            
            self.questionsList[subject] = stringify
            i+=1
        } while i < jsonFile.count
        
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




