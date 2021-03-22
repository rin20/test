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
    var number: Int!
    
    
    
    @IBOutlet var question: UITextView!
    @IBOutlet var P: UIButton!
    @IBOutlet var Q: UIButton!
    @IBOutlet var R: UIButton!
    @IBOutlet var logoS: UIImageView!
    @IBOutlet var back: UIButton!
    @IBOutlet var NEXT: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["日本の原油の輸入相手国第一位はどこ？","カタール","サウジアラビア","アラブ首長国連邦",2])
        quizArray.append(["日本の綿花の輸入相手国第二位はどこ？","ブラジル","アメリカ","オーストラリア",3])
        quizArray.append(["アメリカ合衆国からの輸入品のうち、輸入額が最も高いのは何？","医薬品","航空機類","機械類",3])
        quizArray.append(["二酸化炭素排出量が世界第二位の国・地域はどこ？","アメリカ","中国","EU",1])
        quizArray.append(["人口が世界で４番目に多い国はどこ？","インドネシア","アメリカ","ブラジル",1])
        
        quizArray.shuffle()
        
        choiceQuiz()
        
        logoS.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz(){
        let tmpArray = quizArray[0] as! [Any]
        
        question.text = tmpArray[0] as? String
         
        P.setTitle(tmpArray[1] as? String, for: .normal)
        Q.setTitle(tmpArray[2] as? String, for: .normal)
        R.setTitle(tmpArray[3] as? String, for: .normal)
        
    }
    
    func performSegueToThirdView(){
        performSegue(withIdentifier: "toThirdView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toThirdView"{
            let nextView = segue.destination as! thirdViewController
            
            nextView.argString = String(correctAnswer)
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
    }
    
    @objc func upS(){
        count = count + 0.01
        if count > 0.05{
            timer.invalidate()
            P.backgroundColor = UIColor.orange
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        
        let tmpArray = quizArray[0] as! [Any]
        
        number = sender.tag
        
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
    
    @IBAction func Next(){
        if quizArray.count == 0{
            performSegueToThirdView()
        }else{
            choiceQuiz()
        }
    }
    
    @IBAction func Back(){
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
