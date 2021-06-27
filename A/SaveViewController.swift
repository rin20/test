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
        
        let pink = UIColor(red: 1.00, green: 0.65, blue: 0.66, alpha: 1.00)
        
        //        ユーザーデフォルツからデータを取り出して各項目に表記
        if Cell != 0 {
            var saveData: UserDefaults = UserDefaults.standard
            CellArr = saveData.object(forKey: "quizArr") as! [[Any]]
            question.text = CellArr[Cell][0] as? String
            p.text = CellArr[Cell][1] as? String
            q.text = CellArr[Cell][2] as? String
            r.text = CellArr[Cell][3] as? String
            
            if CellArr[Cell][4] as! Int == 1{
                truthP.backgroundColor = pink
            }else if CellArr[Cell][4] as! Int  == 2{
                truthQ.backgroundColor = pink
            }else if CellArr[Cell][4] as! Int == 3{
                truthR.backgroundColor = pink
            }
            
            
        }
    }
    
    //    正解の選択肢選ぶ時の操作
    @IBAction func True(sender: UIButton){
        
        let pink = UIColor(red: 1.00, green: 0.65, blue: 0.66, alpha: 1.00)
        let blue = UIColor(red: 0.67, green: 0.68, blue: 1.00, alpha: 1.00)
        
        if sender.tag == 1{
            number = 1
            truthP.backgroundColor = pink
            truthQ.backgroundColor = blue
            truthR.backgroundColor = blue
        }else if sender.tag == 2{
            number = 2
            truthQ.backgroundColor = pink
            truthP.backgroundColor = blue
            truthR.backgroundColor = blue
        }else if sender.tag == 3{
            number = 3
            truthR.backgroundColor = pink
            truthP.backgroundColor = blue
            truthQ.backgroundColor = blue
        }
        
    }
    
    
    //    保存の操作
    @IBAction func saveMemo(){
        // 表示してるものを取り込む
        let quizText = question.text
        let choice1 = p.text
        let choice2 = q.text
        let choice3 = r.text
        var correct: Int = 0
        
        if number != 0{
            
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
            
        }else{
            let alert: UIAlertController = UIAlertController(title: "エラー！", message: "正解を選んでください", preferredStyle: .alert)
            
            alert.addAction(
                UIAlertAction(
                    title:"OK",
                    style: .default,
                    handler: { action in
                        print("エラーのアラートは正常に作動しています")
                    })
            )
            
            present(alert, animated: true, completion: nil)
                    }
    }
    
    //    問題を消去
    @IBAction func trash(){
        CellArr.remove(at: Cell)
        let SaveData: UserDefaults = UserDefaults.standard
        SaveData.setValue(CellArr, forKey: "quizArr")
        
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
