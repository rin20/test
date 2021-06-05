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
    @IBOutlet var logoS: UIImageView!
    @IBOutlet var back: UIButton!
    @IBOutlet var NEXT: UIButton!
    
    let rgba = UIColor(red: 1.0, green: 0.81, blue: 0, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
            
            P.backgroundColor = rgba
            Q.backgroundColor = rgba
            R.backgroundColor = rgba
            
            let tmpArray = quizArray[0] as! [Any]
            
            question.text = tmpArray[0] as? String
            
            P.setTitle(tmpArray[1] as? String, for: .normal)
            Q.setTitle(tmpArray[2] as? String, for: .normal)
            R.setTitle(tmpArray[3] as? String, for: .normal)
            
        }
        else{
            let nextView = storyboard!.instantiateViewController(withIdentifier: "thirdVC") as! thirdViewController
            nextView.correctAnswerCount = String(correctAnswer)
            nextView.questionC = String(questionNumber)
            self.present(nextView, animated: true, completion: nil)
            
        }
    }
    
    
    @objc func up (){
        count = count + 0.01
        if count > 0.5{
            timer.invalidate()
            logoS.isHidden = true
        }else{
            logoS.isHidden = false
        }
        choiceQuiz()
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
            
            //            let tmpArray = quizArray[0] as! [Any]
            //
            //            question.text = tmpArray[0] as? String
            //
            //            P.setTitle(tmpArray[1] as? String, for: .normal)
            //            Q.setTitle(tmpArray[2] as? String, for: .normal)
            //            R.setTitle(tmpArray[3] as? String, for: .normal)
            //
            //            print("upT動いてる")
            //        }
        }
    }
        @IBAction func choiceAnswer(sender: UIButton){
            
            let tmpArray = quizArray[0] as! [Any]
            truth = tmpArray[4] as! Int
            
            if P.tag == truth{
                P.backgroundColor = UIColor.orange
            }else if Q.tag == truth{
                Q.backgroundColor = UIColor.orange
            }else if R.tag == truth{
                R.backgroundColor = UIColor.orange
            }
            
            if tmpArray[4] as! Int == sender.tag{
                
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
            
            
        }
        
        
        
    }

