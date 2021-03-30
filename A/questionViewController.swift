//
//  questionViewController.swift
//  A
//
//  Created by Mitsu Kumagai on 2021/03/28.
//

import UIKit

class questionViewController: UIViewController {
    
    @IBOutlet var questionS: UITextView!
    @IBOutlet var PS: UILabel!
    @IBOutlet var QS: UILabel!
    @IBOutlet var RS: UILabel!
    @IBOutlet var truth: UILabel!
    
    var cell = Int()
    var showArr = [[Any]]()
    var truthS = Int()
    var numberS = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let saveData: UserDefaults = UserDefaults.standard
        showArr = saveData.object(forKey: "quizArr") as! [[Any]]
        
        questionS.text = showArr[cell][0] as? String
        PS.text = showArr[cell][1] as? String
        QS.text = showArr[cell][2] as? String
        RS.text = showArr[cell][3] as? String
        numberS = showArr[cell][4] as! Int
        truth.text = showArr[cell][numberS] as? String
    }
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?){
        if segue.identifier == "toSaveViewSegue"{
            let nextView = segue.destination as! SaveViewController
            nextView.Cell = cell
        }
    }
    
    @IBAction func trash(){
        showArr.remove(at: cell)
        let SaveData: UserDefaults = UserDefaults.standard
        SaveData.setValue(showArr, forKey: "quizArr")
        
        let alert: UIAlertController = UIAlertController(title: "消去", message: "問題を消去しました", preferredStyle: .alert)
        
        alert.addAction(
                    UIAlertAction(
                        title:"OK",
                        style: .default,
                        handler: { action in
                            self.navigationController?.popViewController(animated: true)
                        }
                   
                    )
        )
        
        present(alert, animated: true, completion: nil)
        
        
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
