//
//  SaveViewController.swift
//  A
//
//  Created by Mitsu Kumagai on 2021/03/27.
//

import UIKit

class SaveViewController: UIViewController {
    
    
    var saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var question: UITextView!
    @IBOutlet var p: UITextField!
    @IBOutlet var q: UITextField!
    @IBOutlet var r: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveMemo(){
        saveData.set(question.text, forKey: "question")
        saveData.set(p.text, forKey: "p")
        saveData.set(q.text, forKey: "q")
        saveData.set(r.text, forKey: "r")
        
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
