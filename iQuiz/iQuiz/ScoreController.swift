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
    
    var subject: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.topItem!.title = subject
        
        resultsLabel.text = "RESULTS"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
