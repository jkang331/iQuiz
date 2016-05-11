//
//  ScoreController.swift
//  iQuiz
//
//  Created by iGuest on 5/11/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ScoreController : UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var resultsLabel: UILabel!
    
    var subject : String?
    var totalNumberOfQuestions : Int?
    var numberOfCorrectAnswers : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem!.title = subject
        
        resultsLabel.text = "You got \(numberOfCorrectAnswers!)/\(totalNumberOfQuestions!)"
        let fiftyPercent =  Double(totalNumberOfQuestions!) / 2.0
        if Double(numberOfCorrectAnswers!) > fiftyPercent {
            resultsLabel.text = "\(resultsLabel.text!)\n\n Great job!"
        } else {
            resultsLabel.text = "\(resultsLabel.text!)\n\n Better luck next time!"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
