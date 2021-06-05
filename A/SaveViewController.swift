//
//  SaveViewController.swift
//  A
//
//  Created by Mitsu Kumagai on 2021/03/27.
//

import UIKit

class SaveViewController: UIViewController {
    
    
    var saveData: UserDefaults = UserDefaults.standard
    var number: Int = 0
    var Cell: Int = 0
    var CellArr = [[Any]]()
    
    @IBOutlet var question: UITextView!
    @IBOutlet var p: UITextField!
    @IBOutlet var q: UITextField!
    @IBOutlet var r: UITextField!
    @IBOutlet var truthP: UIButton!
    @IBOutlet var truthQ: UIButton!
    @IBOutlet var truthR: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if Cell != 0 {
            var saveData: UserDefaults = UserDefaults.standard
            CellArr = saveData.object(forKey: "quizArr") as! [[Any]]
            question.text = CellArr[Cell][0] as? String
            p.text = CellArr[Cell][1] as? String
            q.text = CellArr[Cell][2] as? String
            r.text = CellArr[Cell][3] as? String
                
        }
    }
    
    @IBAction func True(sender: UIButton){
        if sender.tag == 1{
            number = 1
        }else if sender.tag == 2{
            number = 2
        }else if sender.tag == 3{
            number = 3
        }
    
        let alertS: UIAlertController = UIAlertController(title:"正答決定！", message: "正解は\(number)です！", preferredStyle: .alert)
        
        alertS.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default
                    )
        )
        
        present(alertS, animated: true, completion: nil)
    }
    
    @IBAction func saveMemo(){
        // 表示してるものを取り込む
        let quizText = question.text
        let choice1 = p.text
        let choice2 = q.text
        let choice3 = r.text
        var correct: Int = 0
        
        if number == 1{
            correct = 1
        }else if number == 2{
            correct = 2
        }else if number == 3{
            correct = 3
        }
        
        if Cell != 0{
            CellArr[Cell][0] = question.text as Any
            CellArr[Cell][1] = p.text as Any
            CellArr[Cell][2] = q.text as Any
            CellArr[Cell][3] = r.text as Any
            CellArr[Cell][4] = correct as Any
            
            saveData.setValue(CellArr, forKey: "quizArr")
            
        }else {
            let quiz = [quizText, choice1, choice2, choice3, correct] as [Any]
            
            // 保存しているものにアクセス
            let userDefaults = UserDefaults.standard
            var quizArr: [[Any]] = userDefaults.object(forKey: "quizArr") as! [[Any]]
            quizArr.append(quiz)
            
            // 新しいクイズが入った配列を上書き保存
            userDefaults.set(quizArr, forKey: "quizArr")
        }
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "問題の保存が完了しました！", preferredStyle: .alert)
        
        alert.addAction(
                    UIAlertAction(
                        title:"OK",
                        style: .default,
                        handler: { action in
                            self.navigationController?.popToRootViewController(animated: true)
                        })
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
