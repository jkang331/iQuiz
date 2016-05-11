//
//  AnswerController.swift
//  iQuiz
//
//  Created by iGuest on 5/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class AnswerController : UIViewController {
 
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var AnswerLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    
    var subject: String?
    var questionsList : NSArray?
    var count: Int?
    
    @IBAction func NextQuestion(sender: UIButton) {
        let questionViewController = self.storyboard?.instantiateViewControllerWithIdentifier("question") as! QuestionController
        
        questionViewController.subject = subject
        questionViewController.count = count! + 1
        self.presentViewController(questionViewController, animated: true, completion: nil)
        
    }

//    private func getQuestionLabel() -> String {
//        let text = QuestionLabel!.text!
//        return text
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem!.title = subject
        
        QuestionLabel.text = "\(count!). blah blah blah"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
