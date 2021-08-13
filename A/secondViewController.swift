//
//  secondViewController.swift
//  A
//
//  Created by Mitsu Kumagai on 2021/03/21.
//

import UIKit

class secondViewController: UIViewController {
    
    var quizArray = [Any]()
    var correctAnswer: Int = 0
    var count: Float = 0.0
    var timer: Timer = Timer()
    var truth: Int!
    var number: Int = 0
    var saveData: UserDefaults = UserDefaults.standard
    var checkTimer: Int = 0
    var questionNumber: Int = 0
    
    @IBOutlet var question: UITextView!
    @IBOutlet var P: UIButton!
    @IBOutlet var Q: UIButton!
    @IBOutlet var R: UIButton!
    @IBOutlet var logoS: UILabel!
    @IBOutlet var back: UIButton!
    
    
    let blue = UIColor(red: 0.27, green: 0.54, blue: 0.78, alpha: 1.0)
    let green = UIColor(red: 0.06, green: 0.76, blue: 0.75, alpha: 1.0)
    let orange  = UIColor(red: 0.93, green: 0.52, blue: 0.41, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        P.titleLabel?.adjustsFontSizeToFitWidth = true
        Q.titleLabel?.adjustsFontSizeToFitWidth = true
        R.titleLabel?.adjustsFontSizeToFitWidth = true
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if saveData.object(forKey: "quizArr") != nil{
            quizArray = saveData.object(forKey: "quizArr") as! [Any]
        }else{
            quizArray = [["日本の原油の輸入相手国第一位はどこ？","カタール","サウジアラビア","アラブ首長国連邦",2],["日本の綿花の輸入相手国第二位はどこ？","ブラジル","アメリカ","オーストラリア",3],
                         ["アメリカ合衆国からの輸入品のうち、輸入額が最も高いのは何？","医薬品","航空機類","機械類",3],["二酸化炭素排出量が世界第二位の国・地域はどこ？","アメリカ","中国","EU",1],["人口が世界で４番目に多い国はどこ？","インドネシア","アメリカ","ブラジル",1]]
        }
        
        quizArray.shuffle()
        
        choiceQuiz()
        
        logoS.isHidden = true
        
        checkTimer = 0
        
        questionNumber = quizArray.count
    }
    
    
    
    func choiceQuiz(){
        
        if quizArray.count != 0{
            
            P.backgroundColor = blue
            Q.backgroundColor = blue
            R.backgroundColor = blue
            
            let tmpArray = quizArray[0] as! [Any]
            
            question.text = tmpArray[0] as? String
            
            P.setTitle(tmpArray[1] as? String, for: .normal)
            Q.setTitle(tmpArray[2] as? String, for: .normal)
            R.setTitle(tmpArray[3] as? String, for: .normal)
            
        }else{
            
//            presentメソッドを使って画面遷移
//            let nextView = storyboard!.instantiateViewController(withIdentifier: "thirdVC") as! thirdViewController
//            nextView.correctAnswerCount = String(correctAnswer)
//            nextView.questionC = String(questionNumber)
//            self.present(nextView, animated: true, completion: nil)
            
            let nextView = self.storyboard?.instantiateViewController(withIdentifier: "thirdVC") as! thirdViewController
            nextView.correctAnswerCount = String(correctAnswer)
            nextView.questionC  = String(questionNumber)
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
    }
    
    
    @objc func up (){
        count = count + 0.01
        if count > 0.5{
            timer.invalidate()
            logoS.isHidden = true
            choiceQuiz()
        }else{
            logoS.isHidden = false
            
        }
        
    }
    
    @objc func upS(){
        count = count + 0.01
        if count > 0.5{
            timer.invalidate()
            choiceQuiz()
        }
    }
    
    @objc func upT(){
        count = count + 0.01
        if count > 0.5{
            timer.invalidate()
            
            
        }
    }
    @IBAction func choiceAnswer(sender: UIButton){
        
        if quizArray.count != 0{
        let tmpArray = quizArray[0] as! [Any]
        truth = tmpArray[4] as! Int
        
        
        
        if tmpArray[4] as! Int == sender.tag{
            
            if P.tag == truth{
                P.backgroundColor = green
            }else if Q.tag == truth{
                Q.backgroundColor = green
            }else if R.tag == truth{
                R.backgroundColor = green
            }
            
            if !timer.isValid{
                count = 0.0
                timer = Timer.scheduledTimer(
                    timeInterval:0.01,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: true
                )
            }
            
            correctAnswer = correctAnswer + 1
            
        }else{
            
            if P.tag == truth{
                P.backgroundColor = orange
            }else if Q.tag == truth{
                Q.backgroundColor = orange
            }else if R.tag == truth{
                R.backgroundColor = orange
            }
            
            if !timer.isValid{
                count = 0.0
                timer = Timer.scheduledTimer(
                    timeInterval:0.01,
                    target: self,
                    selector: #selector(self.upS),
                    userInfo: nil,
                    repeats: true)
            }
            
            
        }
        quizArray.remove(at: 0)
        
        }else{
            choiceQuiz()
        }
    }
    
    
    
}

