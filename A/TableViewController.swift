//
//  TableViewController.swift
//  A
//
//  Created by Mitsu Kumagai on 2021/03/27.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var questionArray = [[Any]]()
    
    var userdefaults: UserDefaults = UserDefaults.standard
    var number = Int()
    var numberS: Int = -1
    
//    ストーリーボードで使うテーブルビューを宣言
    @IBOutlet var table: UITableView!
    @IBOutlet var QuestionL: UILabel!
    @IBOutlet var PLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

//        tabelViewのdataSourceメソッドはviewControllerClassに書く、と言う設定
        table.dataSource = self
        table.delegate = self
        
        let saveData: UserDefaults = UserDefaults.standard
        saveData.register(defaults: ["quizArr": [["日本の原油の輸入相手国第一位はどこ？","カタール","サウジアラビア","アラブ首長国連邦",2],["日本の綿花の輸入相手国第二位はどこ？","ブラジル","アメリカ","オーストラリア",3],["アメリカ合衆国からの輸入品のうち、輸入額が最も高いのは何？","医薬品","航空機類","機械類",3],["二酸化炭素排出量が世界第二位の国・地域はどこ？","アメリカ","中国","EU",1],["人口が世界で４番目に多い国はどこ？","インドネシア","アメリカ","ブラジル",1]]])
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if userdefaults.object(forKey: "quizArr") != nil {
            var quizArr: [[Any]] = userdefaults.object(forKey: "quizArr") as! [[Any]]
            questionArray = quizArr
            table.reloadData()
        }
    
        }
    
//    セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionArray.count
        
        
    }
    
//    ID付きのセルを取得して、セル付属のtextLabelに表示させる文字を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = questionArray[indexPath.row][0] as? String
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        number = indexPath.row
        performSegue(withIdentifier: "toViewSegue", sender: nil)
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue , sender: Any?){
        if segue.identifier == "toViewSegue"{
            let nextView = segue.destination as! SaveViewController
            nextView.Cell = number
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

}
