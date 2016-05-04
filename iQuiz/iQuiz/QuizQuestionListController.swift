//
//  QuizQuestionListController.swift
//  iQuiz
//
//  Created by iGuest on 5/3/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuizQuestionListController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    var navBartitle: String?
    @IBOutlet weak var titleBar: UINavigationBar!
    @IBOutlet weak var quizQuestionList: UITableView!
    
    var questionsList = ["Question1", "Question2", "Question3"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let subjectTableIdentifier = "question"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(subjectTableIdentifier)
        
        if cell == nil {
            cell = UITableViewCell.init()
        }
        cell!.textLabel!.text = questionsList[indexPath.row]
        
        //Adding a Separator Line to the Bottom
        let separatorLineView = UIView.init(frame: CGRectMake(0, 74.5 , self.view.frame.width, 1))
        separatorLineView.backgroundColor = UIColor.lightGrayColor()
        cell!.addSubview(separatorLineView)
        
        return cell!;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75.0 //height for cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizQuestionList.delegate = self
        self.quizQuestionList.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
