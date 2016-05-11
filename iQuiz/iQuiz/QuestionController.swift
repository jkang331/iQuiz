//
//  QuestionController.swift
//  iQuiz
//
//  Created by iGuest on 5/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuestionController : UIViewController {

    
    @IBOutlet weak var NavBar: UINavigationBar!
    @IBOutlet weak var QuestionLabel: UILabel!
    var subject: String?
    var count = 1
    
    @IBAction func DisplayAnswer(sender: UIButton) {
        let answerViewController = self.storyboard!.instantiateViewControllerWithIdentifier("answer") as! AnswerController
        answerViewController.subject = subject
        answerViewController.count = count
        self.presentViewController(answerViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar.topItem!.title = subject
        
        QuestionLabel.text = "\(count). blah blah blah"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
