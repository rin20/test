//
//  homeViewController.swift
//  A
//
//  Created by Mitsu Kumagai on 2021/03/21.
//

import UIKit

class homeViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quiz: UILabel!
    @IBOutlet var logo: UIImageView!
    @IBOutlet var A: UIButton!
    @IBOutlet var QuizList: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        QuizList.titleLabel?.adjustsFontSizeToFitWidth = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
