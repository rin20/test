//
//  thirdViewController.swift
//  A
//
//  Created by Mitsu Kumagai on 2021/03/21.
//

import UIKit

class thirdViewController: UIViewController {
    
    var correctAnswer: Int = 0
    
    var correctAnswerCount = ""
    var questionC = ""
    
    @IBOutlet var logoT: UIImageView!
    @IBOutlet var result: UILabel!
    @IBOutlet var answer:UILabel!
    @IBOutlet var back: UIButton!
    @IBOutlet var questionCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answer.text = correctAnswerCount
        questionCount.text = questionC

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func Back(){

        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
        
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
