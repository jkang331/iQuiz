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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar.topItem!.title = subject
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
