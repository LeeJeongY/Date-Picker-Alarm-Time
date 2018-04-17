//
//  ViewController.swift
//  Date Picker Alarm Time
//
//  Created by D7703_23 on 2018. 4. 12..
//  Copyright © 2018년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initial Picker Time setting
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:
            {(myTimer) in
            self.updateTime()
        })
    }
    
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        
        if currentTimeLabel.text == timeLabel.text {
            view.backgroundColor = UIColor.blue
            
            let myAlert = UIAlertController(title: "알림", message: "설정된 시간이 되었습니다!", preferredStyle: .alert)
            
            
            let okAction = UIAlertAction(title: "확인", style: .default) {  // 후행 클로저(Trailing Closure)
                (myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.yellow
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {  // 후행 클로저(Trailing Closure)
                (myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.white
            }
            
            let testAction = UIAlertAction(title: "Delete", style: .destructive, handler:
            {(myAction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.green
            })
            
            myAlert.addAction(okAction)
            myAlert.addAction(cancelAction)
            myAlert.addAction(testAction)
            
            present(myAlert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func changeDatePicker(_ sender: Any) {
        // dateformat
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
    }
    
    
    @IBAction func stopAlert(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

