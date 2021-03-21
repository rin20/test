//
//  thirdViewController.swift
//  A
//
//  Created by Mitsu Kumagai on 2021/03/21.
//

import UIKit

class thirdViewController: UIViewController {
    
    var correctAnswer: Int = 0
    
    var argString = ""
    
    @IBOutlet var logoT: UIImageView!
    @IBOutlet var result: UILabel!
    @IBOutlet var answer:UILabel!
    @IBOutlet var back: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answer.text = argString

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Back(){
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
