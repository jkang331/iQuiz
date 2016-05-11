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
    var questionsList : NSString?
    var count: Int?
    var userSelected: Int?
    
    var currentQuestion: String?
    var currentAnswerNumber: Int?
    var currentAnswer: String?
    
    private var imagePath = ["Correct.png", "Wrong.png"]
    
    @IBAction func NextQuestion(sender: UIButton) {
        if questionsList != "" {
            let questionViewController = self.storyboard?.instantiateViewControllerWithIdentifier("question") as! QuestionController
            
            questionViewController.subject = subject
            questionViewController.count = count! + 1
            questionViewController.questionsList = questionsList
            self.presentViewController(questionViewController, animated: false, completion: nil)
        } else {
            let finalViewController = self.storyboard?.instantiateViewControllerWithIdentifier("final") as! ScoreController
            
            finalViewController.subject = subject
            self.presentViewController(finalViewController, animated: false, completion: nil)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem!.title = subject
        
        QuestionLabel.text = "\(count!). \(currentQuestion!)"
        AnswerLabel.text = "Correct Answer: \n\(currentAnswer!)"
        
        let image : UIImage;
        if userSelected == currentAnswerNumber {
             image = UIImage(named: imagePath[0] )!
        } else {
            image = UIImage(named: imagePath[1] )!
        }
        resultImage.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
