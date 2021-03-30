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
    
    
    
    
    @IBAction func True(sender: UIButton){
        if sender.tag == 1{
            number = number + 1
        }else if sender.tag == 2{
            number = number + 2
        }else if sender.tag == 3{
            number = number + 3
        }
    }
    
    @IBAction func saveMemo(){
        // 表示してるものを取り込む
        let quizText = question.text
        let choice1 = p.text
        let choice2 = q.text
        let choice3 = r.text
        var correct: Int = 0
        
        if number == 1{
        }else if number == 2{
            correct = 2
        }else if number == 3{
            correct = 3
        }
        
        // クイズ形式の配列にする
        let quiz = [quizText, choice1, choice2, choice3, correct] as [Any]
        
        // 保存しているものにアクセス
        let userDefaults = UserDefaults.standard
        var quizArr: [[Any]] = userDefaults.object(forKey: "quizArr") as! [[Any]]
        quizArr.append(quiz)
        
        // 新しいクイズが入った配列を上書き保存
        userDefaults.set(quizArr, forKey: "quizArr")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "問題の保存が完了しました！", preferredStyle: .alert)
        
        alert.addAction(
                    UIAlertAction(
                        title:"OK",
                        style: .default,
                        handler: { action in
                            self.navigationController?.popViewController(animated: true)
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
