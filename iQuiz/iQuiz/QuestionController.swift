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
    var questionsList : NSString?
    var count = 1
    private var question : String?
    private var options : NSArray?
    private var answer: Int?
    
    @IBAction func DisplayAnswer(sender: UIButton) {
        let answerViewController = self.storyboard!.instantiateViewControllerWithIdentifier("answer") as! AnswerController
        answerViewController.subject = subject
        answerViewController.count = count
        answerViewController.questionsList = questionsList
        answerViewController.currentQuestion = question
        answerViewController.currentAnswer = options![answer!] as? String
        answerViewController.userSelected = 1
        answerViewController.currentAnswerNumber = answer
        self.presentViewController(answerViewController, animated: false, completion: nil)
    }
    
    
    private func parseQuestionList() {
        // "~~~\(question!)~~~\(options!)~~~\(answer!)###"
        var breakdown = questionsList?.componentsSeparatedByString("###")
        let questionBreakdown = breakdown![0].componentsSeparatedByString("~~~")
        question = questionBreakdown[1]
        options = questionBreakdown[2].componentsSeparatedByString("|")
        answer = Int(questionBreakdown[3])! - 1
        
        var updatedQuestionList = ""
        breakdown?.removeAtIndex(0)
        if(breakdown!.count > 1) {
            for i in breakdown! {
                if (i != ""){
                    updatedQuestionList = "\(updatedQuestionList)\(i)###"
                }
                
            }
        }
        self.questionsList = updatedQuestionList
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar.topItem!.title = subject
        parseQuestionList()
        QuestionLabel.text = "\(count). \(question!)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
